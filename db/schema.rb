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

ActiveRecord::Schema.define(version: 20171111212858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "christmases", force: :cascade do |t|
    t.datetime "signup_deadline"
    t.index ["signup_deadline"], name: "index_christmases_on_signup_deadline"
  end

  create_table "santas", force: :cascade do |t|
    t.bigint "christmas_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["christmas_id", "user_id"], name: "index_santas_on_christmas_id_and_user_id", unique: true
    t.index ["christmas_id"], name: "index_santas_on_christmas_id"
    t.index ["user_id"], name: "index_santas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "twitter_id"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "secret"
    t.index ["twitter_id"], name: "index_users_on_twitter_id", unique: true
  end

  add_foreign_key "santas", "christmases"
  add_foreign_key "santas", "users"
end
