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

ActiveRecord::Schema.define(version: 20160427093221) do

  create_table "access_levels", force: :cascade do |t|
    t.string "title", limit: 255
  end

  create_table "authorizations", id: false, force: :cascade do |t|
    t.integer "employee_id",     limit: 4, null: false
    t.integer "access_level_id", limit: 4, null: false
  end

  add_index "authorizations", ["access_level_id"], name: "index_authorizations_on_access_level_id", using: :btree
  add_index "authorizations", ["employee_id"], name: "index_authorizations_on_employee_id", using: :btree

  create_table "availabilities", id: false, force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.date     "day",                   null: false
    t.datetime "time_from",             null: false
    t.datetime "time_to",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "availabilities", ["employee_id"], name: "index_availabilities_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name",          limit: 64,              null: false
    t.string   "surname",       limit: 64,              null: false
    t.date     "date_of_birth",                         null: false
    t.string   "email",         limit: 64,              null: false
    t.integer  "shirt_size",    limit: 2,   default: 0
    t.string   "password_hash", limit: 128,             null: false
    t.string   "password_salt", limit: 128,             null: false
    t.datetime "last_login"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "positions", id: false, force: :cascade do |t|
    t.integer "employee_id",   limit: 4, null: false
    t.integer "staff_type_id", limit: 4, null: false
  end

  add_index "positions", ["employee_id"], name: "index_positions_on_employee_id", using: :btree
  add_index "positions", ["staff_type_id"], name: "index_positions_on_staff_type_id", using: :btree

  create_table "staff_types", force: :cascade do |t|
    t.string "title", limit: 64
  end

end
