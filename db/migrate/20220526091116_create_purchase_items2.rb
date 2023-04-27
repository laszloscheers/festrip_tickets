class CreatePurchaseItems2 < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :purchase_id
      t.decimal :total
      t.decimal :unit_price

      t.timestamps
    end
    add_index :purchase_items, :product_id
    add_index :purchase_items, :purchase_id
  end
end
