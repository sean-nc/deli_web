class AddPendingToOrder < ActiveRecord::Migration[5.2]
  def change
  	add_column :cheese_orders, :received, :boolean, default: false
  end
end
