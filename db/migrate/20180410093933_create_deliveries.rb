class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.integer :prefecture
      t.integer :price

      t.timestamps
    end
    add_index :deliveries, :prefecture
    add_index :deliveries, :price
  end
end
