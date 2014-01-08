class AddSurchargeWithDecimalScaleToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :surcharge, :decimal
  end
end
