class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.integer :running_id
      t.integer :done_id
      t.boolean :receipt
      t.boolean :redeemed

      t.timestamps
    end
    add_index :deliveries, :running_id
    add_index :deliveries, :done_id
    add_index :deliveries, [:running_id, :done_id], unique: true
  end
end
