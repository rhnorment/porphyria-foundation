class RemoveResearchFromContacts < ActiveRecord::Migration
  def self.up
    remove_column   :contacts,  :research
    remove_column   :contacts,  :date_of_birth
    change_column   :contacts,  :miscellaneous, :text
  end

  def self.down
    add_column      :contacts, :research, :string, default: ''
    add_column      :contacts,  :date_of_birth, :string
    change_column   :contacts,  :miscellaneous, :string
  end
end
