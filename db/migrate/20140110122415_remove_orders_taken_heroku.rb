class RemoveOrdersTakenHeroku < ActiveRecord::Migration
  def change
  	remove_column :orders, :taken
  end
end
