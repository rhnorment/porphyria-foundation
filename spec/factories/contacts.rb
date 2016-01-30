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
    address_1               'Address One'
    address_2               'Address Two'
    business_phone          '800-555-1212'
    cell_phone              '800-555-1212'
    city                    'New York'
    cme                     'Yes'
    company                 'Example Company'
    country                 'Example Country'
    date_of_birth           Date.new(11/12/1955)
    doctor_packet_sent      'x'
    doctor_packet_sent_on   Date.new(11/12/1955)
    doctor_specialty        'Diabetes'
    email_address           'user@example.com'
    fax_number              '800-555-1212'
    first_name              'Example'
    gift_amount             25.50
    gift_given_on           Date.new(11/12/1955)
    home_phone              '800-555-1212'
    keep                    true
    last_name               'User'
    middle_name             'Middle'
    miscellaneous           'Example User miscellaneous data'
    name_prefix             'Mr.'
    name_suffix             'MD'
    patient_packet_sent      'x'
    patient_packet_sent_on  Date.new(11/12/1955)
    porphyria_type          'HEP'
    state                   'AL'
    waived                  'x'
    zip_code                '55555'
  end
end
