class CreateCheeseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :cheese_orders do |t|
      t.integer :cheese_id
      t.integer :supplier_id
      t.integer :current_units
      t.integer :cases_ordered
      t.integer :case_price
      t.integer :units_per_case
      t.text :description

      t.timestamps
    end
    add_index :cheese_orders, :cheese_id
    add_index :cheese_orders, :supplier_id
  end
end
