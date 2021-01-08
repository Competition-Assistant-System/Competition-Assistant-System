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

ActiveRecord::Schema.define(version: 2021_01_08_044220) do

  create_table "file_uploads", force: :cascade do |t|
    t.integer "file_size"
    t.string "file_name"
    t.integer "User_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file_md5"
    t.index ["User_id"], name: "index_file_uploads_on_User_id"
  end

  create_table "grants", force: :cascade do |t|
    t.string "group_name"
    t.boolean "sys_admin"
    t.boolean "sys_read"
    t.boolean "sys_download"
    t.boolean "sys_upload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "score_bases", force: :cascade do |t|
    t.string "base_name"
    t.integer "base_score"
    t.float "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "score_results", force: :cascade do |t|
    t.integer "score_origin"
    t.float "score_result"
    t.integer "ScoreBase_id"
    t.integer "User_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ScoreBase_id"], name: "index_score_results_on_ScoreBase_id"
    t.index ["User_id"], name: "index_score_results_on_User_id"
  end

  create_table "user_informations", force: :cascade do |t|
    t.string "nickname"
    t.string "school"
    t.integer "User_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["User_id"], name: "index_user_informations_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "Grant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Grant_id"], name: "index_users_on_Grant_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
