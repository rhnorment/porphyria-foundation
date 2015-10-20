class RemoveFieldsFromContacts < ActiveRecord::Migration
  def self.up
    remove_column :contacts, :media
  end

  def self.down
    add_column :contacts, :media, :string, default: ''
  end
end
