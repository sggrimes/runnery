class RemoveOrderIdFromDeliveries < ActiveRecord::Migration
  def change
  	remove_column :deliveries, :order_id
  end
end
