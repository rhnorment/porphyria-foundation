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
  task transpose_date: :environment do

  end

end