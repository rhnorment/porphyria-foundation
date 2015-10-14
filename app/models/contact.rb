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
#  miscellaneous          :text             default("")
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

class Contact < ActiveRecord::Base

  PORPHYRIA_TYPES = %w(AIP VP HCP ADP PCT EPP CEP HEP)
  YES_NO = %w(Yes No)
  YES_NO_MESSAGE = 'Must be either YES or NO'

  # validates     :apf_member,      inclusion: { in: YES_NO, message: YES_NO_MESSAGE }
  validates     :email_address,   email: true,  allow_nil: true, allow_blank: true
  validates     :first_name,      presence: true
  validates     :last_name,       presence: true
  validates     :porphyria_type,  inclusion: { in: PORPHYRIA_TYPES,
                                                message: '%{value} is not a valid type',
                                                allow_blank: true }

  scope         :members,         -> { where(apf_member: 'Yes') }
  scope         :non_members,     -> { where.not(apf_member: 'Yes') }

  def full_name
    [name_prefix, first_name, middle_name, last_name, name_suffix].join(' ')
  end

  def city_state_zip
    [city, state, zip_code].join(' ')
  end

  def birthday
    [birth_month, birth_day, birth_year].join(' ')
  end





end
