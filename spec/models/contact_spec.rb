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

require 'rails_helper'

describe Contact, type: :model do

  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  it { should have_db_column(:address1).of_type(:string) }
  it { should have_db_column(:address2).of_type(:string) }
  it { should have_db_column(:apf_member).of_type(:boolean) }
  it { should have_db_column(:date_of_birth).of_type(:date)}
  it { should have_db_column(:cell_phone).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:cme).of_type(:boolean) }
  it { should have_db_column(:company).of_type(:string) }
  it { should have_db_column(:doctor_packet_sent).of_type(:boolean) }
  it { should have_db_column(:doctor_packet_sent_on).of_type(:date) }
  it { should have_db_column(:doctor_specialty).of_type(:string) }
  it { should have_db_column(:email_address).of_type(:string) }
  it { should have_db_column(:fax_number).of_type(:string) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:gift_amount).of_type(:decimal).with_options(precision: 8, scalae: 2) }
  it { should have_db_column(:gift_date).of_type(:date) }
  it { should have_db_column(:home_phone).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:media).of_type(:boolean) }
  it { should have_db_column(:middle_initial).of_type(:string) }
  it { should have_db_column(:miscellaneous).of_type(:text) }
  it { should have_db_column(:name_prefix).of_type(:string) }
  it { should have_db_column(:name_suffix).of_type(:string) }
  it { should have_db_column(:patient_packet_sent).of_type(:boolean) }
  it { should have_db_column(:patient_packet_sent_on).of_type(:date) }
  it { should have_db_column(:porphyria_type).of_type(:string) }
  it { should have_db_column(:research).of_type(:boolean) }
  it { should have_db_column(:state).of_type(:string) }
  it { should have_db_column(:status).of_type(:string) }
  it { should have_db_column(:waived).of_type(:boolean) }
  it { should have_db_column(:work_phone).of_type(:string) }
  it { should have_db_column(:zip_code).of_type(:string) }

  it { should have_db_index(:email_address)}

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it 'only allows appropriate TYPE data' do
    expect(build(:contact, porphyria_type: 'HUNT')).to_not be_valid
  end

  it 'only accepts valid US states'

  it 'properly formats telephone and fax numbers'



end
