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

ActiveRecord::Schema.define(version: 20160527141542) do

  create_table "user_feedbacks", force: :cascade do |t|
    t.string   "mobile_number",   limit: 255
    t.string   "current_brand",   limit: 255
    t.string   "current_variant", limit: 255
    t.string   "other_brand",     limit: 255
    t.string   "other_variant",   limit: 255
    t.integer  "no_of_sticks",    limit: 4
    t.string   "reason_cb",       limit: 255
    t.string   "reason_cv",       limit: 255
    t.string   "reason_ob",       limit: 255
    t.string   "reason_ov",       limit: 255
    t.string   "reason_sticks",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
