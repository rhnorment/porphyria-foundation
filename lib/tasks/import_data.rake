require 'csv'

namespace :import_data do
  desc 'Import contacts from CSV'
  task contacts: :environment do
    filename = File.join(Rails.root, 'import_test.csv')
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      contact = Contact.create!(row.to_h)
      counter += 1 if contact.persisted?
    end

    puts "Imported #{counter} contacts."
  end

  desc 'migrate 3 birthday fields to 1 date_of_birth field'
  task create_date_of_birth: :environment do
    counter = 0

    Contact.all.each do |contact|
      if birthday_fields_exist?(contact)
        begin
          string_to_parse = contact.birth_year + contact.birth_month + contact.birth_day
          contact.update(date_of_birth: Date.parse(string_to_parse))
        rescue Exception => e
          puts "#{contact.id} failed"
          puts "#{e.class}: #{e.message}"
        end
        
        counter += 1 unless e
      end
    end

    puts "Updated #{counter} contacts"
  end

  private

    def birthday_fields_exist?(contact)
      !contact.birth_day.blank? && !contact.birth_month.blank? && !contact.birth_year.blank?
    end

end
