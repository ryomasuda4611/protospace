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

ActiveRecord::Schema.define(version: 20160816104326) do

  create_table "prototype_images", force: :cascade do |t|
    t.string   "image",        limit: 255
    t.integer  "status",       limit: 4
    t.integer  "prototype_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prototype_images", ["prototype_id"], name: "index_prototype_images_on_prototype_id", using: :btree

  create_table "prototypes", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "catch_copy", limit: 255
    t.text     "concept",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prototypes", ["user_id"], name: "index_prototypes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255
    t.text     "avatar",                 limit: 65535
    t.text     "profile",                limit: 65535
    t.string   "member",                 limit: 255
    t.text     "works",                  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "prototype_images", "prototypes"
  add_foreign_key "prototypes", "users"
end
