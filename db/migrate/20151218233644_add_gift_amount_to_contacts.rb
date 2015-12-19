class AddGiftAmountToContacts < ActiveRecord::Migration
  def change
    add_column  :contacts, :gift_amount, :decimal, precision: 8, scale: 2
  end
end
