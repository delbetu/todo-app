# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_25_180954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_items", force: :cascade do |t|
    t.string "list_title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_group_items_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_item_id"
    t.index ["group_item_id"], name: "index_items_on_group_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_hash"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "group_items", "users"
  add_foreign_key "items", "group_items"
end
