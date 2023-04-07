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

ActiveRecord::Schema[7.0].define(version: 2023_04_07_175551) do
  create_table "active_admin_comments", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.integer "author_id"
    t.string "author_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.integer "current_sign_in_ip", unsigned: true
    t.integer "last_sign_in_ip", unsigned: true
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "authors", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "authorships", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "zine_id", null: false
    t.index ["author_id", "zine_id"], name: "index_authorships_on_author_id_and_zine_id", unique: true
  end

  create_table "comments", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "zine_id"
    t.text "content"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "faves", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "zine_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "tags", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "zine_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zines", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean "published", default: true
    t.text "full_text"
    t.text "excerpt"
    t.string "cover_image"
    t.string "download_url"
    t.timestamp "added_at"
    t.integer "author_count", default: 0, null: false
    t.string "pdf"
    t.integer "legacy_id"
    t.index ["published", "updated_at"], name: "index_zines_on_published_and_updated_at"
  end

end
