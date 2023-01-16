class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :product_name, null: false
      t.string :store_name, null: false
      t.integer :regular_price, null: false
      t.integer :discounted_price, null: false

      t.timestamps
    end
  end
end
