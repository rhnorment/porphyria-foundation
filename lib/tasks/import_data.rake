# == Schema Information
#
# Table name: contacts
#
#  id                     :integer          not null, primary key
#  address_1              :string           default("")
#  address_2              :string           default("")
#  apf_member             :string           default("")
#  birth_day              :string           default("")
#  birth_month            :string           default("")
#  birth_year             :string           default("")
#  business_phone         :string           default("")
#  cell_phone             :string           default("")
#  city                   :string           default("")
#  cme                    :string           default("")
#  company                :string           default("")
#  country                :string           default("")
#  date_of_birth          :string           default("")
#  doctor_packet_sent     :string           default("")
#  doctor_packet_sent_on  :string           default("")
#  doctor_specialty       :string           default("")
#  email_address          :string           default("")
#  fax_number             :string           default("")
#  first_name             :string           not null
#  gift_amount            :string           default("")
#  gift_given_on          :string           default("")
#  home_phone             :string           default("")
#  last_name              :string           not null
#  media                  :string           default("")
#  middle_name            :string           default("")
#  miscellaneous          :string           default("")
#  name_prefix            :string           default("")
#  name_suffix            :string           default("")
#  patient_packet_sent    :string           default("")
#  patient_packet_sent_on :string           default("")
#  porphyria_type         :string           default("")
#  research               :string           default("")
#  state                  :string           default("")
#  status                 :string           default("")
#  waived                 :string           default("")
#  zip_code               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'csv'

namespace :import_data do

  desc 'Import contacts from CSV'

  task contacts: :environment do
    filename = File.join(Rails.root, 'APF_import_test.csv')

    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      contact = Contact.create!(row.to_h)

      counter += 1 if contact.persisted?
    end

    puts "Imported #{counter} contacts."
  end

end