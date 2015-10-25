require 'csv'

namespace :create_join_date do
  desc 'Import data into temporary table'
  task temp_contacts: :environment do
    filename = File.join(Rails.root, 'create_date.csv')
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      temp_contact = TempContact.create!(row.to_h)
      counter += 1 if temp_contact.persisted?
    end

    puts "Imported #{counter} contacts."
  end

  desc 'Transpose tenp_contact data to contact data'
  task modify_created_at: :environment do
    counter = 0
    temps_to_change = TempContact.where('create_date IS NOT NULL')

    temps_to_change.each do |temp|
      contact = Contact.find_by_first_name_and_last_name(temp.first_name, temp.last_name)
      if contact
        contact.update(created_at: temp.create_date)
        counter += 1
      end
    end

    puts "Modified #{counter} contacts."
  end

end