# == Schema Information
#
# Table name: contacts
#
#  id                     :integer          not null, primary key
#  address_1              :string           default("")
#  address_2              :string           default("")
#  business_phone         :string           default("")
#  cell_phone             :string           default("")
#  city                   :string           default("")
#  cme                    :string           default("")
#  company                :string           default("")
#  country                :string           default("")
#  doctor_packet_sent     :string           default("")
#  doctor_specialty       :string           default("")
#  email_address          :string           default("")
#  fax_number             :string           default("")
#  first_name             :string           default("")
#  gift_amount            :string           default("")
#  home_phone             :string           default("")
#  last_name              :string           default("")
#  middle_name            :string           default("")
#  miscellaneous          :text             default("")
#  name_prefix            :string           default("")
#  name_suffix            :string           default("")
#  patient_packet_sent    :string           default("")
#  porphyria_type         :string           default("")
#  state                  :string           default("")
#  status                 :string           default("")
#  waived                 :string           default("")
#  zip_code               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  date_of_birth          :date
#  gift_given_on          :date
#  doctor_packet_sent_on  :date
#  patient_packet_sent_on :date
#

class Contact < ActiveRecord::Base

  include CSVBuilders

  PORPHYRIA_TYPES = %w(AIP VP HCP ADP PCT EPP CEP HEP)
  YES_NO = %w(Yes No)

  scope   :international_members,   -> { where.not(country: 'USA') }
  scope   :with_email_addresses,    -> { where('email_address IS NOT NULL') }

  def self.reset_create_date
    all.each do |contact|
      date_to_compare = contact.created_at.to_s.split(' ')[0]

      if date_to_compare.eql?('2015-10-15')
        contact.update(created_at: '2001-10-15')
      end
    end
  end

end
