class RemoveSurchargeScale < ActiveRecord::Migration
  def change
  	remove_column :orders, :surcharge, :decimal, :scale
  end
end
