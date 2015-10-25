class FinalDataCleanup < ActiveRecord::Migration
  def self.up
    remove_column   :contacts,  :apf_member
    drop_table      :temp_contacts
  end

  def self.down
    add_column      :contacts,  :apf_member,  :boolean, default: true
  end
end
