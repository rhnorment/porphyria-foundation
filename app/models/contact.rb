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
#  research               :boolean          default(FALSE)
#  gift_amount            :decimal(8, 2)
#  keep                   :boolean          default(FALSE)
#

class Contact < ActiveRecord::Base

  include CCIntegration
  include CSVBuilders
  include XLSBuilders

  PORPHYRIA_TYPES = %w(None AIP VP HCP ADP PCT EPP CEP HEP)
  YES_NO = %w(Yes No)

  scope   :international_members,   -> { where.not(country: 'USA') }
  scope   :with_email_addresses,    -> { where.not(email_address: '') }
  
  def city_state_zip
    [city, state, zip_code].join(' ')
  end
  
  def full_name
    [name_prefix, first_name, middle_name, last_name, name_suffix].join(' ')
  end

end
