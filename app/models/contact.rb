# == Schema Information
#
# Table name: contacts
#
#  id                     :integer          not null, primary key
#  address1               :string           default("")
#  address2               :string           default("")
#  apf_member             :boolean          default(FALSE)
#  cell_phone             :string           default("")
#  city                   :string           default("")
#  cme                    :boolean          default(FALSE)
#  company                :string           default("")
#  date_of_birth          :date
#  doctor_packet_sent     :boolean          default(FALSE)
#  doctor_packet_sent_on  :date
#  doctor_specialty       :string           default("")
#  email_address          :string           not null
#  fax_number             :string           default("")
#  first_name             :string           not null
#  gift_amount            :decimal(8, 2)
#  gift_date              :date
#  home_phone             :string           default("")
#  last_name              :string           not null
#  media                  :boolean          default(FALSE)
#  middle_initial         :string           default("")
#  miscellaneous          :text             default("")
#  name_prefix            :string           default("")
#  name_suffix            :string           default("")
#  patient_packet_sent    :boolean          default(FALSE)
#  patient_packet_sent_on :date
#  porphyria_type         :string           default("")
#  research               :boolean          default(FALSE)
#  state                  :string           default("")
#  status                 :string           default("")
#  waived                 :boolean          default(TRUE)
#  work_phone             :string           default("")
#  zip_code               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Contact < ActiveRecord::Base

  validates     :email_address,   presence: true



end
