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

ActiveRecord::Schema.define(version: 2019_05_11_065702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "date"
    t.float "rating"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "hawker_id"
    t.index ["hawker_id"], name: "index_comments_on_hawker_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "comment_id"
    t.index ["comment_id"], name: "index_foods_on_comment_id"
  end

  create_table "hawkers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "hero_image_url"
    t.text "opening_hours"
    t.text "closing_hours"
    t.float "latitude"
    t.float "longitude"
    t.text "site_url"
  end

  create_table "images", force: :cascade do |t|
    t.text "image_url"
    t.bigint "hawker_id"
    t.index ["hawker_id"], name: "index_images_on_hawker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "hawkers"
  add_foreign_key "comments", "users"
  add_foreign_key "foods", "comments"
end
