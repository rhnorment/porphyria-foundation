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

require 'rails_helper'

describe Contact, type: :model do

  let(:resource_class) { 'Contact' }
  let(:all_resources) { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource) { all_resources[resource_class] }

  it 'has a valid resource name' do
    expect(resource.resource_name).to eq('Contact')
  end

  it 'should display in the menu bar' do
    expect(resource).to be_include_in_menu
  end

  it 'has the default set of CRU actions available to it' do
    expect(resource.defined_actions).to include(:index, :show, :new, :create, :edit, :update, :destroy)
  end

  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  it { should have_db_column(:address_1).of_type(:string) }
  it { should have_db_column(:address_2).of_type(:string) }
  it { should have_db_column(:apf_member).of_type(:string) }
  it { should have_db_column(:birth_day).of_type(:string) }
  it { should have_db_column(:birth_month).of_type(:string) }
  it { should have_db_column(:business_phone).of_type(:string) }
  it { should have_db_column(:birth_year).of_type(:string) }
  it { should have_db_column(:cell_phone).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:cme).of_type(:string) }
  it { should have_db_column(:company).of_type(:string) }
  it { should have_db_column(:country).of_type(:string) }
  it { should have_db_column(:date_of_birth).of_type(:date) }
  it { should have_db_column(:doctor_packet_sent).of_type(:string) }
  it { should have_db_column(:doctor_packet_sent_on).of_type(:string) }
  it { should have_db_column(:doctor_specialty).of_type(:string) }
  it { should have_db_column(:email_address).of_type(:string) }
  it { should have_db_column(:fax_number).of_type(:string) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:gift_amount).of_type(:string) }
  it { should have_db_column(:gift_given_on).of_type(:string) }
  it { should have_db_column(:home_phone).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:middle_name).of_type(:string) }
  it { should have_db_column(:miscellaneous).of_type(:text) }
  it { should have_db_column(:name_prefix).of_type(:string) }
  it { should have_db_column(:name_suffix).of_type(:string) }
  it { should have_db_column(:patient_packet_sent).of_type(:string) }
  it { should have_db_column(:patient_packet_sent_on).of_type(:string) }
  it { should have_db_column(:porphyria_type).of_type(:string) }
  it { should have_db_column(:state).of_type(:string) }
  it { should have_db_column(:status).of_type(:string) }
  it { should have_db_column(:waived).of_type(:string) }
  it { should have_db_column(:zip_code).of_type(:string) }
end
