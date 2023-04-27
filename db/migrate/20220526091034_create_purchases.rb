class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.decimal :subtotal
      t.decimal :total
      t.integer :user_id

      t.timestamps
    end
    add_index :purchases, :user_id
  end
end
