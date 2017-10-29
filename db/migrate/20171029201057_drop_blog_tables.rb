class DropBlogTables < ActiveRecord::Migration[5.0]
  def up
    drop_table :posts
    drop_table :taggings
    drop_table :tags
  end

  def down
    raise ActiveRecord::IrreversableMigration
  end
end
