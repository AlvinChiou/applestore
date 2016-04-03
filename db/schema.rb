# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160403043323) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "order_infos", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "product_name"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "total",          default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "token"
    t.boolean  "is_paid",        default: false
    t.string   "payment_method"
    t.string   "aasm_state",     default: "order_placed"
  end

  add_index "orders", ["aasm_state"], name: "index_orders_on_aasm_state"
  add_index "orders", ["token"], name: "index_orders_on_token"

  create_table "photos", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "enable",     default: true
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "pre_order",              default: 0
    t.integer  "be_wished",              default: 0
    t.boolean  "can_be_wish",            default: false
    t.integer  "original_quantity",      default: 0
    t.integer  "product_status_id",      default: 0
    t.integer  "category_id",            default: 0
    t.integer  "cost",                   default: 0
    t.text     "introduction"
    t.boolean  "quantity_limit",         default: true
    t.integer  "original_price",         default: 0
    t.integer  "shipment",               default: 100
    t.integer  "free_shipping_quantity", default: 2
  end

  create_table "shipment_policies", force: :cascade do |t|
    t.string   "name"
    t.integer  "free_shipment_price"
    t.integer  "free_shipment_amount"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "shippings", force: :cascade do |t|
    t.string   "shipping_method"
    t.integer  "status"
    t.integer  "cost"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",       null: false
    t.string   "encrypted_password",                default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "is_admin",                          default: false
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "fb_id",                  limit: 20
    t.string   "token"
    t.string   "name"
    t.string   "gender"
    t.string   "time_zone",                         default: "Taipei"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wish_items", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "product_id"
    t.integer  "quantity",     default: 1
    t.integer  "wish_list_id"
  end

  create_table "wish_lists", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "email"
    t.boolean  "is_notified", default: false
    t.integer  "user_id"
  end

end
