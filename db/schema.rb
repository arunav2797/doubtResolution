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

ActiveRecord::Schema.define(version: 2021_07_11_125502) do

  create_table "comments", force: :cascade do |t|
    t.string "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "doubt_id"
    t.string "email"
    t.index ["doubt_id"], name: "index_comments_on_doubt_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "doubts", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "status"
    t.string "solution"
    t.index ["user_id"], name: "index_doubts_on_user_id"
  end

  create_table "ta_doubts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "doubt_id"
    t.index ["doubt_id"], name: "index_ta_doubts_on_doubt_id"
    t.index ["user_id"], name: "index_ta_doubts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "doubts"
  add_foreign_key "comments", "users"
  add_foreign_key "doubts", "users"
  add_foreign_key "ta_doubts", "doubts"
  add_foreign_key "ta_doubts", "users"
end
