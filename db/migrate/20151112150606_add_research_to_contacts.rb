class AddResearchToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :research, :boolean, default: false
  end
end
