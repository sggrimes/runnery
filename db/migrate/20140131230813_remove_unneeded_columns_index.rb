class RemoveUnneededColumnsIndex < ActiveRecord::Migration
  def change
  	remove_column :deliveries, :running_id
  	remove_column :deliveries, :done_id
  end
end
