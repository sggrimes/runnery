class RemoveSurcharge < ActiveRecord::Migration
  def change
  	remove_column :orders, :surcharge
  end
end
