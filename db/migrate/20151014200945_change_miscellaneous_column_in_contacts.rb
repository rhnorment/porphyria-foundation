class ChangeMiscellaneousColumnInContacts < ActiveRecord::Migration
  def change
    change_column   :contacts,  :miscellaneous,  :text,  default: ''
  end
end
