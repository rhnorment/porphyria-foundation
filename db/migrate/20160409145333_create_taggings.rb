class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :post_id, index: true
      t.integer :tag_id, index: true

      t.timestamps null: false
    end
  end
end
