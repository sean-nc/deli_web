class CreateCheeseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :cheese_orders do |t|
      t.integer :cheese_id
      t.integer :current_units
      t.integer :ordered_units

      t.timestamps
    end
    add_index :cheese_orders, :cheese_id
  end
end
