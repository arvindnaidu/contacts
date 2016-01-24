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

ActiveRecord::Schema.define(version: 20160123120530) do

  create_table "account_sessions", force: :cascade do |t|
    t.string   "session_id",         limit: 70, null: false
    t.integer  "account_id",         limit: 8,  null: false
    t.string   "authenticity_token", limit: 70, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "account_sessions", ["session_id"], name: "unique_session_id", unique: true, using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "name",       limit: 100,                 null: false
    t.string   "email",      limit: 100,                 null: false
    t.string   "password",   limit: 100,                 null: false
    t.string   "mobile",     limit: 100
    t.string   "dob",        limit: 30
    t.boolean  "gender",     limit: 1
    t.string   "city",       limit: 50
    t.string   "state",      limit: 50
    t.string   "country",    limit: 50
    t.string   "zip",        limit: 20
    t.boolean  "deleted",    limit: 1,   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "contact_notes", force: :cascade do |t|
    t.integer  "contact_id", limit: 8,   null: false
    t.string   "content",    limit: 200, null: false
    t.string   "color",      limit: 20
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "contact_reminders", force: :cascade do |t|
    t.integer  "contact_id", limit: 8,   null: false
    t.string   "content",    limit: 200, null: false
    t.string   "color",      limit: 20
    t.datetime "time",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "account_id", limit: 8,                   null: false
    t.string   "name",       limit: 100,                 null: false
    t.string   "email",      limit: 100
    t.string   "mobile",     limit: 100
    t.string   "dob",        limit: 30
    t.boolean  "gender",     limit: 1
    t.string   "city",       limit: 50
    t.string   "state",      limit: 50
    t.string   "country",    limit: 50
    t.string   "zip",        limit: 20
    t.boolean  "deleted",    limit: 1,   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

end
