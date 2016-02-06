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

FactoryGirl.define do
  factory :contact do
    address_1             '123 Main Street'
    address_2             'Unit 9'
    business_phone        { x_number }
    cell_phone            { x_number }
    city                  'Any Town'
    cme                   'CME'
    company               'ACME Company'
    country               'USA'
    date_of_birth         Date.new(2000, 2, 3)
    doctor_packet_sent    'Y'
    doctor_packet_sent_on Date.new(2001, 2, 3)
    doctor_specialty      'Cancer'
    email_address         'user@example.com'
    fax_number            { x_number }
    first_name            'Example'
    gift_amount           100.00
    gift_given_on         Date.new(2002, 2, 3)
    home_phone            { x_number }
    keep                  false
    last_name             'User'
    middle_name           ''
    miscellaneous         'This is some miscellaneous data.'
    name_prefix           'Mr.'
    name_suffix           'Jr.'
    patient_packet_sent   'Y'
    patient_packet_sent_on  Date.new(2003, 2, 3)
    porphyria_type        'AIP'
    state                 'AL'
    status                'Status'
    waived                'No'
    zip_code              '55555'
  end
end

def x_number
  '800 800 0000'
end