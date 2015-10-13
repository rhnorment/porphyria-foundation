require 'rails_helper'

describe Contact, type: :model do

  it 'has a valid factory'

  it { should have_db_column(:apf_member).of_type(:boolean) }
  it { should have_db_column(:name_prefix).of_type(:string) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:middle_initial).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:name_suffix).of_type(:string) }
  it { should have_db_column(:email_address).of_type(:string) }
  it { should have_db_column(:home_phone).of_type(:string) }
  it { should have_db_column(:work_phone).of_type(:string) }
  it { should have_db_column(:cell_phone).of_type(:string) }
  it { should have_db_column(:fax_number).of_type(:string) }
  it { should have_db_column(:company).of_type(:string) }
  it { should have_db_column(:address1).of_type(:string) }
  it { should have_db_column(:address2).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:state).of_type(:string) }
  it { should have_db_column(:zip_code).of_type(:string) }
  it { should have_db_column(:status).of_type(:string) }
  it { should have_db_column(:type).of_type(:string) }
  it { should have_db_column(:doc_specialty).of_type(:string) }
  it { should have_db_column(:miscellaneous).of_type(:text) }
  it { should have_db_column(:gift_date).of_type(:date) }
  it { should have_db_column(:gift_amount).of_type(:decimal).with_options(precision: 8, scalae: 2) }
  it { should have_db_column(:waived).of_type(:boolean) }
  it { should have_db_column(:cme).of_type(:boolean) }
  it { should have_db_column(:research).of_type(:boolean) }
  it { should have_db_column(:media).of_type(:boolean) }
  it { should have_db_column(:patient_packet_sent).of_type(:boolean) }
  it { should have_db_column(:patient_packet_sent_on).of_type(:date) }
  it { should have_db_column(:doctor_packet_sent).of_type(:boolean) }
  it { should have_db_column(:doctor_packet_sent_on).of_type(:date) }

  it { should have_db_index(:email_address)}

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email_address) }


  it 'accepts a valid email address'

  it 'does not accept invalid email addresses'

  it 'properly formats telephone and fax numbers'

  it 'only allows appropriate TYPE data'

  it 'only accepts valid US states'



end