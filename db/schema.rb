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

ActiveRecord::Schema.define(version: 2019_02_05_170822) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.boolean "dead", default: false
    t.boolean "walker", default: false
    t.string "user_uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.integer "user_id"
    t.integer "cid"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "rule"
    t.boolean "finish", default: false
    t.boolean "hardcore", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "rule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rid"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.string "role", default: "user"
    t.boolean "payed", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
