class AddFieldsForBlog < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :bio, :text, default: ''
    add_column :posts, :admin_user_id, :integer
    add_column :posts, :intro, :string, default: ''

    remove_column :posts, :author

    add_index  :posts, :admin_user_id
  end

  def self.down
    remove_index  :posts, :admin_user_id

    add_column    :posts, :author, :string, default: ''

    remove_column :admin_users, :bio
    remove_column :posts, :admin_user_id
    remove_column :posts, :intro
  end
end
