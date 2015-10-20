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
#  first_name             :string           default("")
#  gift_amount            :string           default("")
#  gift_given_on          :string           default("")
#  home_phone             :string           default("")
#  last_name              :string           default("")
#  middle_name            :string           default("")
#  miscellaneous          :string           default("")
#  name_prefix            :string           default("")
#  name_suffix            :string           default("")
#  patient_packet_sent    :string           default("")
#  patient_packet_sent_on :string           default("")
#  porphyria_type         :string           default("")
#  state                  :string           default("")
#  status                 :string           default("")
#  waived                 :string           default("")
#  zip_code               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  factory :contact do
    address_1               'Address One'
    address_2               'Address Two'
    apf_member              'Yes'
    birth_day               '25'
    birth_year              '1997'
    business_phone          test_phone_number
    cell_phone              test_phone_number
    city                    'New York'
    cme                     'Yes'
    company                 'Example Company'
    country                 'Example Country'
    date_of_birth           ''
    doctor_packet_sent      'x'
    doctor_packet_sent_on   test_date
    doctor_specialty        'Diabetes'
    email_address           'user@example.com'
    fax_number              test_phone_number
    first_name              'Example'
    gift_amount             '50'
    gift_given_on           test_date
    home_phone              test_phone_number
    last_name               'User'
    middle_name             'Middle'
    miscellaneous           'Example User miscellaneous data'
    name_prefix             'Mr.'
    name_suffix             'MD'
    patient_packet_sent      'x'
    patient_packet_sent_on  test_date
    porphyria_type          'HEP'
    state                   'AL'
    waived



    email_address     'user@example.com'
    address_1         '1212 Main Street'
    city              'Anytown'
    state             'FL'
    zip_code          '12345'
    date_of_birth     '12/12/2005'
    porphyria_type    'AIP'
    gift_amount       '100.23'
  end
end

def test_phone_number
  '800-555-1212'
end

def test_date
  '12/25/1997'
end
