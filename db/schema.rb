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

ActiveRecord::Schema.define(version: 20150808160434) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "micropost_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bookings", ["micropost_id"], name: "index_bookings_on_micropost_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "microposts", force: :cascade do |t|
    t.string   "region"
    t.string   "price"
    t.text     "details"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "town_id"
    t.string   "picture"
    t.string   "extraDetails"
    t.string   "size"
  end

  add_index "microposts", ["town_id"], name: "index_microposts_on_town_id"
  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "user_id"
    t.boolean  "seen",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "notifications", ["micropost_id"], name: "index_notifications_on_micropost_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "towns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "town_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_requests", ["town_id"], name: "index_user_requests_on_town_id"
  add_index "user_requests", ["user_id"], name: "index_user_requests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "encrypted_password"
    t.boolean  "admin",              default: false
    t.string   "rest_digest"
    t.datetime "rest_sent_at"
    t.string   "surname"
    t.string   "activation_digest"
    t.boolean  "activated",          default: false
    t.datetime "activated_at"
    t.string   "salt"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
