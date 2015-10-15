class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string    :address_1,               default: ''
      t.string    :address_2,               default: ''
      t.string    :apf_member,              default: ''
      t.string    :birth_day,               default: ''
      t.string    :birth_month,             default: ''
      t.string    :birth_year,              default: ''
      t.string    :business_phone,          default: ''
      t.string    :cell_phone,              default: ''
      t.string    :city,                    default: ''
      t.string    :cme,                     default: ''
      t.string    :company,                 default: ''
      t.string    :country,                 default: ''
      t.string    :date_of_birth,           default: ''
      t.string    :doctor_packet_sent,      default: ''
      t.string    :doctor_packet_sent_on,   default: ''
      t.string    :doctor_specialty,        default: ''
      t.string    :email_address,           default: ''
      t.string    :fax_number,              default: ''
      t.string    :first_name,              null: false
      t.string    :gift_amount,             default: ''
      t.string    :gift_given_on,           default: ''
      t.string    :home_phone,              default: ''
      t.string    :last_name,               null: false
      t.string    :media,                   default: ''
      t.string    :middle_name,             default: ''
      t.string    :miscellaneous,           default: ''
      t.string    :name_prefix,             default: ''
      t.string    :name_suffix,             default: ''
      t.string    :patient_packet_sent,     default: ''
      t.string    :patient_packet_sent_on,  default: ''
      t.string    :porphyria_type,          default: ''
      t.string    :research,                default: ''
      t.string    :state,                   default: ''
      t.string    :status,                  default: ''
      t.string    :waived,                  default: ''
      t.string    :zip_code,                default: ''
      t.timestamps                          null: false
    end
  end
end