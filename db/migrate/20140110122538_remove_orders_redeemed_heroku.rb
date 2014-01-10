class RemoveOrdersRedeemedHeroku < ActiveRecord::Migration
  def change
  	remove_column :orders, :redeemed
  end
end
