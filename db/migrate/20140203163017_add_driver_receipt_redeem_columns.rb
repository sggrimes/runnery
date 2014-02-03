class AddDriverReceiptRedeemColumns < ActiveRecord::Migration
  def change
  	add_column :orders, :driver_id, :integer
  	add_column :orders, :receipt, :boolean
  	add_column :orders, :redeemed, :boolean
  end
end
