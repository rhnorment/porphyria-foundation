class RenameGiftAmountToTemp < ActiveRecord::Migration
  def change
    rename_column :contacts, :gift_amount, :temp_gift_amount
  end
end
