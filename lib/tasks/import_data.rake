require 'csv'

namespace :import_data do
  desc 'Import research data into Contacts table'

  task research_data: :environment do
    nil_counter = 0
    non_nil_counter = 0
    contacts_found = 0
    filename = File.join(Rails.root, 'research_data.csv')

    CSV.foreach(filename, headers: true) do |row|
      temp_contact = row.to_h
      first_name = temp_contact["first_name"]
      last_name = temp_contact["last_name"]
      research = temp_contact["research"]

      if !research.nil?
        if contact = Contact.find_by(first_name: first_name, last_name: last_name)
          begin
            contact.update(research: true)
          rescue Exception => e
             puts "#{contact.id} failed"
             puts "#{e.class}: #{e.message}"
          end

          contacts_found += 1
        end

        non_nil_counter += 1
      else
        nil_counter += 1
      end
    end

    puts "#{non_nil_counter} non nil records"
    puts "#{nil_counter} nil records"
    puts "#{contacts_found} contacts found"
  end
end
