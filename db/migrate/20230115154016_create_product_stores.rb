class CreateProductStores < ActiveRecord::Migration[7.0]
  def change
    create_table :product_stores do |t|
      t.references :products
      t.references :stores
      t.integer :regular_price, null: false
      t.integer :discounted_price, null: false

      t.timestamps
    end
  end
end
