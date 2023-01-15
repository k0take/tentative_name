class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :store_name, null: false

      t.timestamps
    end
  end
end
