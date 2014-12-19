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

ActiveRecord::Schema.define(version: 20141219225326) do

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "entity"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "dead_phone"
    t.string   "email"
    t.string   "alt_email"
    t.string   "dead_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dial_id"
    t.integer  "conversation_id"
    t.integer  "investing_id"
    t.integer  "timing_id"
    t.integer  "motivator_id"
    t.text     "body"
  end

  add_index "contacts", ["conversation_id"], name: "index_contacts_on_conversation_id"
  add_index "contacts", ["dial_id"], name: "index_contacts_on_dial_id"
  add_index "contacts", ["investing_id"], name: "index_contacts_on_investing_id"
  add_index "contacts", ["motivator_id"], name: "index_contacts_on_motivator_id"
  add_index "contacts", ["timing_id"], name: "index_contacts_on_timing_id"

  create_table "conversations", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dials", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investings", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motivators", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "stripe_id"
    t.string   "name"
    t.integer  "amount"
    t.string   "interval"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.integer  "street_no"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "year_built"
    t.integer  "units"
    t.integer  "purchase_year"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["contact_id"], name: "index_properties_on_contact_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "timings", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
