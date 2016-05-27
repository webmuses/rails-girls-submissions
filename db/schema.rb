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

ActiveRecord::Schema.define(version: 20160527100125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rates", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "submission_id"
    t.integer  "user_id"
    t.integer  "value"
  end

  add_index "rates", ["submission_id"], name: "index_rates_on_submission_id", using: :btree
  add_index "rates", ["user_id"], name: "index_rates_on_user_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.integer  "age"
    t.string   "codecademy_username"
    t.text     "description"
    t.string   "english"
    t.string   "operating_system"
    t.boolean  "first_time"
    t.text     "goals"
    t.text     "problems"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "html"
    t.string   "css"
    t.string   "js"
    t.string   "ror"
    t.string   "db"
    t.string   "programming_others"
    t.boolean  "rejected",            default: false
    t.string   "codecademy_status",   default: "pending"
  end

  add_index "submissions", ["email"], name: "index_submissions_on_email", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname",                        null: false
  end

end
