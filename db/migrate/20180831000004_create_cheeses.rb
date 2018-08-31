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
      t.float :cost
      t.float :price
      t.string :slug

      t.timestamps
    end
    add_index :cheeses, :supplier_id
  end
end
