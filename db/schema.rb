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

ActiveRecord::Schema.define(version: 2019_03_26_232738) do

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "rid"
    t.integer "user_id"
    t.boolean "correct", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value"
  end

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
    t.integer "points", default: 0
    t.string "status", default: "none"
    t.integer "house_id"
  end

  create_table "deaths", force: :cascade do |t|
    t.string "name"
    t.string "status", default: "alive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "did"
    t.float "alive"
    t.float "dead"
    t.float "wight"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "rule"
    t.boolean "finish", default: false
    t.boolean "hardcore", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "fid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_answers", force: :cascade do |t|
    t.string "text"
    t.integer "aid"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "house_id"
    t.integer "user_id"
  end

  create_table "house_questions", force: :cascade do |t|
    t.string "text"
    t.integer "qid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "points", default: 0
    t.integer "hid"
    t.string "name"
    t.string "uuid"
    t.string "words"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "qid"
    t.integer "value"
    t.string "glyph"
    t.string "answer"
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
    t.string "username"
    t.boolean "paid", default: false
    t.integer "house_id"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
