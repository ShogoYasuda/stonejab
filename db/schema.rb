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

ActiveRecord::Schema.define(version: 20140629022711) do

  create_table "dungeons", force: true do |t|
    t.integer  "d_id"
    t.string   "kind"
    t.string   "leader"
    t.string   "friend"
    t.string   "sub1"
    t.string   "sub2"
    t.string   "sub3"
    t.string   "sub4"
    t.text     "comment"
    t.string   "user_name"
    t.integer  "like"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monsters", force: true do |t|
    t.string   "name"
    t.string   "main_element"
    t.string   "sub_element"
    t.string   "main_type"
    t.string   "sub_type"
    t.integer  "cost"
    t.integer  "rare"
    t.string   "hp"
    t.string   "atk"
    t.string   "heal"
    t.string   "skill"
    t.string   "leader_skill"
    t.string   "arousal1"
    t.string   "arousal2"
    t.string   "arousal3"
    t.string   "arousal4"
    t.string   "arousal5"
    t.string   "arousal6"
    t.string   "arousal7"
    t.string   "arousal8"
    t.string   "arousal9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
