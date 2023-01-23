class CreateProductStores < ActiveRecord::Migration[7.0]
  def change
    create_table :product_stores do |t|
      t.references :product
      t.references :store
      t.integer :regular_price, null: false
      t.integer :discounted_price, null: false

      t.timestamps
    end
  end
end
