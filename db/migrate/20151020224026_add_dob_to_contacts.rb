class AddDobToContacts < ActiveRecord::Migration
  def self.up
    add_column  :contacts,  :date_of_birth,   :date
  end

  def self.down
    remove_column :contacts,  :date_of_birth
  end
end

