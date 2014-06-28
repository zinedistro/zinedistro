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

ActiveRecord::Schema.define(version: 20140622053608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorships", id: false, force: true do |t|
    t.integer "author_id", null: false
    t.integer "zine_id",   null: false
  end

  add_index "authorships", ["author_id", "zine_id"], name: "index_authorships_on_author_id_and_zine_id", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "zine_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faves", force: true do |t|
    t.integer  "user_id"
    t.integer  "zine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "zine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "zines", force: true do |t|
    t.string   "title",                       null: false
    t.string   "subtitle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",    default: true
    t.text     "full_text"
    t.text     "excerpt"
    t.string   "cover_image"
    t.string   "download_url"
    t.datetime "added_at"
    t.integer  "author_count", default: 0,    null: false
    t.string   "pdf"
    t.integer  "legacy_id"
  end

end
