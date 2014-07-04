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

ActiveRecord::Schema.define(version: 20140703211806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "cohorts", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", force: true do |t|
    t.string   "first_name",                                  null: false
    t.string   "last_name"
    t.string   "email"
    t.uuid     "uuid",         default: "uuid_generate_v4()"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
  end

  create_table "students", force: true do |t|
    t.text     "first_name",                                          null: false
    t.text     "last_name"
    t.integer  "cohort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.string   "github"
    t.string   "linkedin"
    t.string   "short_bio"
    t.string   "email",                                               null: false
    t.uuid     "uuid",                 default: "uuid_generate_v4()"
    t.string   "cities_to_work"
    t.string   "developer_role"
    t.string   "city_from"
    t.string   "personal_website_url"
    t.string   "avatar"
    t.string   "resume"
    t.boolean  "registered",           default: false
  end

end
