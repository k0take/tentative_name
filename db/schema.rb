# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_14_073741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_stores", force: :cascade do |t|
    t.bigint "products_id"
    t.bigint "stores_id"
    t.integer "regular_price", null: false
    t.integer "discounted_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_product_stores_on_products_id"
    t.index ["stores_id"], name: "index_product_stores_on_stores_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "product_name", null: false
    t.string "store_name", null: false
    t.integer "regular_price", null: false
    t.integer "discounted_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "products", "users"
end
