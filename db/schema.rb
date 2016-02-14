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

ActiveRecord::Schema.define(version: 20151120234025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "due2day_items", force: :cascade do |t|
    t.string   "content"
    t.integer  "due2day_list_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "completed_at"
  end

  add_index "due2day_items", ["due2day_list_id"], name: "index_due2day_items_on_due2day_list_id", using: :btree

  create_table "due2day_lists", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "due2day_items", "due2day_lists"
end
