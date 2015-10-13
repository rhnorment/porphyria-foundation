class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string    :address1,                default: ''
      t.string    :address2,                default: ''
      t.boolean   :apf_member,              default: false
      t.string    :cell_phone,              default: ''
      t.string    :city,                    default: ''
      t.boolean   :cme,                     default: false
      t.string    :company,                 default: ''
      t.date      :date_of_birth
      t.boolean   :doctor_packet_sent,      default: false
      t.date      :doctor_packet_sent_on
      t.string    :doctor_specialty,        default: ''
      t.string    :email_address,           null: false,            index: true
      t.string    :fax_number,              default: ''
      t.string    :first_name,              null: false
      t.decimal   :gift_amount,             precision: 8, scale: 2
      t.date      :gift_date
      t.string    :home_phone,              default: ''
      t.string    :last_name,               null: false
      t.boolean   :media,                   default: false
      t.string    :middle_initial,          default: ''
      t.text      :miscellaneous,           default: ''
      t.string    :name_prefix,             default: ''
      t.string    :name_suffix,             default: ''
      t.boolean   :patient_packet_sent,     default: false
      t.date      :patient_packet_sent_on
      t.string    :porphyria_type,          default: ''
      t.boolean   :research,                default: false
      t.string    :state,                   default: ''
      t.string    :status,                  default: ''
      t.boolean   :waived,                  default: true
      t.string    :work_phone,              default: ''
      t.string    :zip_code,                default: ''
      t.timestamps                          null: false
    end
  end
end
