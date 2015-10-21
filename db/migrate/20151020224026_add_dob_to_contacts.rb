class AddDobToContacts < ActiveRecord::Migration
  def self.up
    add_column  :contacts,  :date_of_birth,   :date
    Rake::Task['import_data:create_date_of_birth'].invoke
  end

  def self.down
    remove_column :contacts,  :date_of_birth
  end
end

