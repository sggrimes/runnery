class AddSurchargeToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :surcharge, :float
  end
end
