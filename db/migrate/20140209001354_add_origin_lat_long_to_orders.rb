class AddOriginLatLongToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :origin_latitude, :float
  	add_column :orders, :origin_longitude, :float
  end
end
