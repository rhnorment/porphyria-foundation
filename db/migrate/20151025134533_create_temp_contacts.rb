class CreateTempContacts < ActiveRecord::Migration
  def change
    create_table :temp_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :create_date

      t.timestamps null: false
    end
  end
end
