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

ActiveRecord::Schema.define(version: 20141127013419) do

  create_table "applications", force: true do |t|
    t.string   "application_status"
    t.datetime "update_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "position_id"
  end

  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "positions", force: true do |t|
    t.date     "post_date"
    t.date     "deadline"
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "pos_type"
    t.string   "level"
    t.string   "position_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "positions", ["user_id"], name: "index_positions_on_user_id"

  create_table "reimbursements", force: true do |t|
    t.float    "money"
    t.string   "reimburse_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "position_id"
  end

  add_index "reimbursements", ["position_id"], name: "index_reimbursements_on_position_id"
  add_index "reimbursements", ["user_id"], name: "index_reimbursements_on_user_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
