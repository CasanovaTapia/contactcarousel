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

ActiveRecord::Schema.define(version: 20141213003154) do

  create_table "calls", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "result"
  end

  create_table "conversations", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dials", force: true do |t|
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

  create_table "timings", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
