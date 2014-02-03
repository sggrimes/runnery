class DropDelivery < ActiveRecord::Migration
  def change
  	drop_table :deliveries
  end
end
