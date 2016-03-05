class ChangePostUrlToSlug < ActiveRecord::Migration
  def change
    rename_column :posts, :post_url, :slug
  end
end
