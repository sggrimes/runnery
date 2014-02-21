class AddLocationsUserIdCreatedAtIndex < ActiveRecord::Migration
  def change
  	#add_index :locations, [:user_id, :created_at]
  end
end
