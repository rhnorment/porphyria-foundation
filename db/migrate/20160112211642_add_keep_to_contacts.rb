class AddKeepToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :keep, :boolean, default: false
  end
end
