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

ActiveRecord::Schema.define(version: 20140831112615) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "colors", force: true do |t|
    t.string   "name"
    t.integer  "variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "colors_variants", id: false, force: true do |t|
    t.integer "color_id"
    t.integer "variant_id"
  end

  create_table "crystals", force: true do |t|
    t.string   "name"
    t.integer  "amount"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: true do |t|
    t.date     "delivery_date"
    t.string   "deadline"
    t.integer  "speed"
    t.string   "full_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "email"
    t.string   "tel"
    t.text     "info"
    t.boolean  "git_box"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "guests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests_variants", id: false, force: true do |t|
    t.integer "guest_id"
    t.integer "variant_id"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "variant_id"
  end

  create_table "line_items", force: true do |t|
    t.string   "units"
    t.integer  "size"
    t.integer  "age"
    t.integer  "height"
    t.integer  "chest"
    t.integer  "waist"
    t.integer  "hips"
    t.integer  "biceps"
    t.integer  "elbow"
    t.integer  "wrist"
    t.integer  "collar"
    t.integer  "shoulder"
    t.integer  "neck_circle"
    t.integer  "from_neck"
    t.integer  "to_waist"
    t.integer  "to_skirt"
    t.integer  "sleeves"
    t.integer  "skirt"
    t.integer  "body"
    t.string   "crystal_type"
    t.integer  "crystal_amount"
    t.text     "special_request"
    t.string   "model_name"
    t.decimal  "price"
    t.integer  "product_id"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.text     "colors_additions"
    t.boolean  "collar_present"
    t.boolean  "skirt_present"
    t.boolean  "sleeves_present"
  end

  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status"
  end

  create_table "payment_notifications", force: true do |t|
    t.text     "params"
    t.integer  "order_id"
    t.string   "status"
    t.string   "transaction_id"
    t.string   "create"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "type"
    t.string   "status"
    t.decimal  "amount"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.integer  "variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "order",              default: 0
  end

  create_table "products", force: true do |t|
    t.string   "lang"
    t.string   "name"
    t.integer  "price"
    t.integer  "old_price"
    t.text     "description"
    t.text     "short_desc"
    t.string   "crystal_type"
    t.integer  "crystal_amount"
    t.string   "sleeves"
    t.string   "skirt"
    t.string   "collar"
    t.string   "stock_for_sale"
    t.string   "title"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sleeves_price",   default: 0
    t.integer  "skirt_price",     default: 0
    t.integer  "collar_price",    default: 0
    t.boolean  "collar_present"
    t.boolean  "skirt_present"
    t.boolean  "sleeves_present"
  end

  create_table "texts", force: true do |t|
    t.string   "language"
    t.text     "description"
    t.text     "short_desc"
    t.string   "title"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_variants", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "variant_id"
  end

  create_table "variants", force: true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.integer  "line_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color_id"
    t.boolean  "default"
    t.string   "stock"
  end

end
