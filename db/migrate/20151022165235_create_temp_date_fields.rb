class CreateTempDateFields < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.rename  :gift_given_on, :temp_gift_given_on
      t.rename  :doctor_packet_sent_on, :temp_doctor_packet_sent_on
      t.rename  :patient_packet_sent_on,  :temp_patient_packet_sent_on
    end
  end

  def self.down
    change_table :contacts do |t|
      t.rename  :temp_gift_given_on, :gift_given_on
      t.rename  :temp_doctor_packet_sent_on, :doctor_packet_sent_on
      t.rename  :temp_patient_packet_sent_on,  :patient_packet_sent_on
    end
  end
end