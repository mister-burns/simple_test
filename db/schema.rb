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

ActiveRecord::Schema.define(version: 20131031053926) do

  create_table "jobs", force: true do |t|
    t.string   "govt_id"
    t.string   "position"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position_title"
    t.string   "organization_name"
    t.string   "rate_interval_code"
    t.integer  "minimum"
    t.integer  "maximum"
    t.datetime "end_date"
    t.string   "locations"
    t.string   "url"
  end

  create_table "lists", force: true do |t|
    t.string   "govt_id"
    t.string   "position"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "position_title"
    t.string   "organization_name"
    t.string   "rate_interval_code"
    t.integer  "minimum"
    t.integer  "maximum"
    t.string   "locations"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_lists", force: true do |t|
    t.string   "lable"
    t.integer  "number_of_episodes"
    t.integer  "number_of_seasons"
    t.datetime "release_date"
    t.integer  "wiki_page_id"
    t.integer  "wiki_page_revision_id"
    t.string   "language"
    t.string   "country"
    t.string   "network"
    t.string   "format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tvshows", force: true do |t|
    t.float    "netflix_rating"
    t.float    "imdb_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
