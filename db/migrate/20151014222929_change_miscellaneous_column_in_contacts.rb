class ChangeMiscellaneousColumnInContacts < ActiveRecord::Migration
  def self.up
    change_column   :contacts,  :miscellaneous,  :text,  default: ''
  end

  def self.down
    change_column   :contacts,  :miscellaneous,  :string,  default: ''
  end
end
