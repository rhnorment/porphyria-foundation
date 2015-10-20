class RemoveResearchFromContacts < ActiveRecord::Migration
  def self.up
    remove_column   :contacts,  :research
    change_column   :contacts,  :date_of_birth, :date
    change_column   :contacts,  :miscellaneous, :text
  end

  def self.down
    add_column      :contacts, :research, :string, default: ''
    change_column   :contacts,  :date_of_birth, :string
    change_column   :contacts,  :miscellaneous, :string
  end
end
