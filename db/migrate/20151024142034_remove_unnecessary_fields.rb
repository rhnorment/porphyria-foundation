class RemoveUnnecessaryFields < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.remove  :birth_day
      t.remove  :birth_month
      t.remove  :birth_year
      t.remove  :temp_gift_given_on
      t.remove  :temp_doctor_packet_sent_on
      t.remove  :temp_patient_packet_sent_on
    end
  end

  def self.down
    change_table :contacts do |t|
      t.string  :birth_day
      t.string  :birth_month
      t.string  :birth_year
      t.string  :temp_gift_given_on
      t.string  :temp_doctor_packet_sent_on
      t.string  :temp_patient_packet_sent_on
    end
  end
end
