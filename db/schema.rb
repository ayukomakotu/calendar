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

ActiveRecord::Schema.define(version: 2022_08_21_072232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appoints", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "telephone"
    t.date "day"
    t.time "time"
    t.string "kind"
    t.string "result"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_appoints_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "address"
    t.string "telephone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.integer "car"
    t.time "start"
    t.time "finish"
    t.bigint "user_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_events_on_customer_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "offices", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_offices_on_name", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.integer "number"
    t.integer "price"
    t.date "day"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.bigint "route_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_orders_on_event_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["route_id"], name: "index_orders_on_route_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_routes_on_name", unique: true
  end

  create_table "targets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "office_id"
    t.integer "year"
    t.integer "all"
    t.integer "tr_3"
    t.integer "tr_4"
    t.integer "tr_5"
    t.integer "tr_6"
    t.integer "tr_7"
    t.integer "tr_8"
    t.integer "tr_9"
    t.integer "tr_10"
    t.integer "tr_11"
    t.integer "tr_12"
    t.integer "tr_1"
    t.integer "tr_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_targets_on_office_id"
    t.index ["user_id"], name: "index_targets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.string "password_digest", null: false
    t.string "remember_digest"
    t.bigint "office_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["number"], name: "index_users_on_number", unique: true
    t.index ["office_id"], name: "index_users_on_office_id"
  end

  add_foreign_key "appoints", "users"
  add_foreign_key "events", "customers"
  add_foreign_key "events", "users"
  add_foreign_key "orders", "events"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "routes"
  add_foreign_key "orders", "users"
  add_foreign_key "targets", "offices"
  add_foreign_key "targets", "users"
  add_foreign_key "users", "offices"
end
