class CreateCheeses < ActiveRecord::Migration[5.2]
  def change
    create_table :cheeses do |t|
      t.string :name
      t.text :region
      t.string :milk
      t.string :texture
      t.string :strength
      t.string :wine_pairing
      t.text :description
      t.integer :supplier_id
      t.integer :cost
      t.integer :price
      t.string :slug
      t.integer :in_stock
      t.integer :stock_goal
      t.date :expires_on

      t.timestamps
    end
    add_index :cheeses, :supplier_id
  end
end
