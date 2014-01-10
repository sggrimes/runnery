class RemoveOrdersDoneHeroku < ActiveRecord::Migration
  def change
  	remove_column :orders, :done
  end
end
