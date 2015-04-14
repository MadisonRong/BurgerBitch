***REMOVED*** encoding: UTF-8
***REMOVED*** This file is auto-generated from the current state of the database. Instead
***REMOVED*** of editing this file, please use the migrations feature of Active Record to
***REMOVED*** incrementally modify your database, and then regenerate this schema definition.
***REMOVED***
***REMOVED*** Note that this schema.rb definition is the authoritative source for your
***REMOVED*** database schema. If you need to create the application database on another
***REMOVED*** system, you should be using db:schema:load, not running all the migrations
***REMOVED*** from scratch. The latter is a flawed and unsustainable approach (the more migrations
***REMOVED*** you'll amass, the slower it'll run and the greater likelihood for issues).
***REMOVED***
***REMOVED*** It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150413055347) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",                                null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "dish_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dish_types", ["name"], name: "index_dish_types_on_name", unique: true

  create_table "dishes", force: :cascade do |t|
    t.integer  "dish_type_id",  null: false
    t.integer  "restaurant_id", null: false
    t.string   "name",          null: false
    t.float    "price",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "dish_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname",   null: false
    t.string   "email",      null: false
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
