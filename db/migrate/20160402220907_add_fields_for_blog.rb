class AddFieldsForBlog < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :bio, :text, default: ''
    add_column :posts, :intro, :string, default: ''
  end

  def self.down
    remove_column :admin_users, :bio
    remove_column :posts, :intro
  end
end
