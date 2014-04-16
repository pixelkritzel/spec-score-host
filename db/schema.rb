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

ActiveRecord::Schema.define(version: 20140416175046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sc_projects", force: true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.integer  "count_specs"
    t.integer  "count_succeeded"
    t.integer  "count_failures"
    t.integer  "count_pending"
    t.float    "overall_duration"
    t.integer  "count_of_scores"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sc_projects", ["name"], name: "index_sc_projects_on_name", using: :btree
  add_index "sc_projects", ["owner_id"], name: "index_sc_projects_on_owner_id", using: :btree
  add_index "sc_projects", ["token"], name: "index_sc_projects_on_token", using: :btree

  create_table "sc_scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.float    "duration",   default: 0.0
    t.integer  "specs",      default: 0
    t.integer  "succeeded",  default: 0
    t.integer  "failed",     default: 0
    t.integer  "pending",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sc_scores", ["project_id"], name: "index_sc_scores_on_project_id", using: :btree
  add_index "sc_scores", ["user_id"], name: "index_sc_scores_on_user_id", using: :btree

  create_table "sc_teammates", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sc_teammates", ["project_id"], name: "index_sc_teammates_on_project_id", using: :btree
  add_index "sc_teammates", ["user_id"], name: "index_sc_teammates_on_user_id", using: :btree

  create_table "sc_users", force: true do |t|
    t.string   "email"
    t.string   "nick"
    t.integer  "count_specs",                  default: 0
    t.integer  "count_succeeded",              default: 0
    t.integer  "count_failures",               default: 0
    t.float    "overall_duration",             default: 0.0
    t.integer  "count_scores",                 default: 0
    t.string   "api_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",           default: "",  null: false
    t.string   "reset_password_token"
    t.date     "reset_password_token_sent_at"
    t.date     "remember_created_at"
    t.integer  "sign_in_count",                default: 0,   null: false
    t.date     "current_sign_in_at"
    t.date     "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "sc_users", ["api_token"], name: "index_sc_users_on_api_token", using: :btree
  add_index "sc_users", ["email"], name: "index_sc_users_on_email", using: :btree
  add_index "sc_users", ["reset_password_token"], name: "index_sc_users_on_reset_password_token", unique: true, using: :btree

end
