class AddIndexToUsersPhone < ActiveRecord::Migration
  def change
  	add_index :users, :phone
  end
end
