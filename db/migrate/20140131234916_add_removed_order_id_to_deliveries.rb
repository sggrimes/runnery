class AddRemovedOrderIdToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :order_id, :integer
  end
end
