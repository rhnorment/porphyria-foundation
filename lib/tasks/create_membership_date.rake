require 'csv'

namespace :create_join_date do
  desc 'Import data into temporary table'
  task temp_contacts: :environment do
    filename = File.join(Rails.root, 'all_records_2.csv')
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

      if contact.present? && needs_to_change?(contact)
        begin
          contact.update(created_at: correct_date(temp))
        rescue Exception => e
          puts "#{contact.id} failed"
          puts "#{e.class}: #{e.message}"
        end
        counter += 1 unless e
      end
    end

    puts "Modified #{counter} contacts."
  end

  desc 'Change created_at datetime to 10/15/2001'
  task change_created_at: :environment do
    Contact.all.each { |contact| puts contact.created_at }
  end

end

def needs_to_change?(contact)
  date_to_comp = contact.created_at.to_s.split(' ')[0]
  date_to_comp.eql?('2001-10-15')
end

def correct_date(temp)
  date_to_join = temp.create_date.split('/')
  date_to_join[2] + date_to_join[0] + date_to_join[1]
end
