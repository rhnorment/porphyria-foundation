class AddPublishOnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publish_on, :datetime, default: nil
  end
end
