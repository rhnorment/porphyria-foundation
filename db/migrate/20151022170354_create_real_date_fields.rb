class CreateRealDateFields < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.date  :gift_given_on
      t.date  :doctor_packet_sent_on
      t.date  :patient_packet_sent_on
    end
  end

  def self.down
    change_table :contacts do |t|
      t.remove  :gift_given_on
      t.remove  :doctor_packet_sent_on
      t.remove  :patient_packet_sent_on
    end
  end
end
