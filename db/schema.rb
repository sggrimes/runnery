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

ActiveRecord::Schema.define(version: 20140219180745) do

  create_table "locations", force: true do |t|
    t.float    "lat"
    t.float    "long"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "address"
    t.string   "phone"
    t.integer  "user_id"
    t.boolean  "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "surcharge"
    t.integer  "driver_id"
    t.boolean  "receipt"
    t.boolean  "redeemed"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "origin_latitude"
    t.float    "origin_longitude"
  end

  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "user_type"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["phone"], name: "index_users_on_phone"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
