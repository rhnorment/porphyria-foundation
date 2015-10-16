class RemoveFieldsFromContacts < ActiveRecord::Migration
  change_table :contacts do |t|
    t.remove :media
  end
end
