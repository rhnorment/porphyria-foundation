class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :author,        default: ''
      t.text      :body,          default: ''
      t.string    :image,         default: ''
      t.string    :post_url,      default: ''
      t.boolean   :published,     default: false
      t.datetime  :published_at,  default: nil
      t.string    :title,         default: ''

      t.timestamps null: false
    end

    add_index :posts, :post_url
  end
end
