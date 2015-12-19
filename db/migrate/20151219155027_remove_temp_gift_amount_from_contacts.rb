class RemoveTempGiftAmountFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :temp_gift_amount
  end
end
