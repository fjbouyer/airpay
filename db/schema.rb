# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170801153241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "reservation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["reservation_id"], name: "index_messages_on_reservation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.integer  "product_price_incl_vat_cents"
    t.float    "product_vat_rate"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["order_id"], name: "index_order_products_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_products_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reservation_id"
    t.integer  "person_quantity"
    t.integer  "total_price_incl_vat_cents"
    t.float    "reservation_vat_rate"
    t.string   "status"
    t.string   "postal_code"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "cart_snapshot"
    t.json     "payment"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["reservation_id"], name: "index_orders_on_reservation_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_category_id"
    t.integer  "price_incl_vat_cents"
    t.float    "vat_rate"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_path"
    t.index ["product_category_id"], name: "index_products_on_product_category_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "sport_category_id"
    t.integer  "user_id"
    t.date     "date"
    t.date     "time"
    t.integer  "number_of_hour"
    t.integer  "price_per_hour_incl_vat_cents"
    t.float    "vat_rate"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["sport_category_id"], name: "index_reservations_on_sport_category_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "sport_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "minimum_players"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "postal_code"
    t.string   "phone_number"
    t.string   "photo_url"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "messages", "reservations"
  add_foreign_key "messages", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "reservations"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "product_categories"
  add_foreign_key "reservations", "sport_categories"
  add_foreign_key "reservations", "users"
end
