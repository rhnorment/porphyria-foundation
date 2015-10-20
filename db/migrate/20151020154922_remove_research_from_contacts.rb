class RemoveResearchFromContacts < ActiveRecord::Migration
  def self.up
    remove_column   :contacts, :research
  end

  def self.down
    add_column      :contacts, :research, :string, default: ''
  end
end
