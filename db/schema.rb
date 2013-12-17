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

ActiveRecord::Schema.define(version: 20131216175657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "names", force: true do |t|
    t.string   "given_name"
    t.string   "interpretation"
    t.text     "us_births"
    t.text     "named_per_year"
    t.text     "us_birth_percentage"
    t.text     "us_population_alive"
    t.text     "most_commone_age"
    t.text     "alternative_names"
    t.text     "etymology"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
