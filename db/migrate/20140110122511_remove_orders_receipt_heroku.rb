class RemoveOrdersReceiptHeroku < ActiveRecord::Migration
  def change
  	remove_column :orders, :receipt
  end
end
