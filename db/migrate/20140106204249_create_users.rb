class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :email
      t.boolean :type
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
