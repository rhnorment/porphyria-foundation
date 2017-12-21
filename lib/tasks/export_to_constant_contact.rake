require 'csv'

namespace :export do
  desc 'exporting contacts with email address to CSV file'

  task export_for_constant_contact: :environment do
    file = CSV.open('contacts.csv', 'w') do |csv|
      valid_contacts = Contact.where.not(email_address: '')
      csv << ['first_name', 'last_name', 'email_address'] # column headers

      valid_contacts.each do |contact|
        csv << [contact.first_name, contact.last_name, contact.email_address]
      end
    end
  end
end