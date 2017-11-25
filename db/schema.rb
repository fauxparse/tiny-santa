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

ActiveRecord::Schema.define(version: 20171125222217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "santa_id"
    t.string "encrypted_name"
    t.string "encrypted_name_iv"
    t.string "encrypted_line_1"
    t.string "encrypted_line_1_iv"
    t.string "encrypted_line_2"
    t.string "encrypted_line_2_iv"
    t.string "encrypted_suburb"
    t.string "encrypted_suburb_iv"
    t.string "encrypted_city"
    t.string "encrypted_city_iv"
    t.string "encrypted_postcode"
    t.string "encrypted_postcode_iv"
    t.string "encrypted_country"
    t.string "encrypted_country_iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["santa_id"], name: "index_addresses_on_santa_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.bigint "santa_id"
    t.string "uid", limit: 32
    t.index ["santa_id"], name: "index_candidates_on_santa_id"
    t.index ["uid", "santa_id"], name: "index_candidates_on_uid_and_santa_id"
  end

  create_table "christmases", force: :cascade do |t|
    t.datetime "signup_deadline"
    t.index ["signup_deadline"], name: "index_christmases_on_signup_deadline"
  end

  create_table "santas", force: :cascade do |t|
    t.bigint "christmas_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipient_id"
    t.index ["christmas_id", "user_id"], name: "index_santas_on_christmas_id_and_user_id", unique: true
    t.index ["christmas_id"], name: "index_santas_on_christmas_id"
    t.index ["recipient_id"], name: "index_santas_on_recipient_id"
    t.index ["user_id"], name: "index_santas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "screen_name"
    t.string "email"
    t.string "uid"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "secret"
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "addresses", "santas", on_delete: :cascade
  add_foreign_key "santas", "christmases"
  add_foreign_key "santas", "santas", column: "recipient_id", on_delete: :nullify
  add_foreign_key "santas", "users"
end
