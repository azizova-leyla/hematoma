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

ActiveRecord::Schema.define(version: 20170326210731) do

  create_table "fighters", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name"
    t.string   "club"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name"], name: "index_fighters_on_first_name_and_last_name", unique: true
  end

  create_table "tournament_fighters", force: :cascade do |t|
    t.integer  "tournament_id", null: false
    t.integer  "fighter_id",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["fighter_id"], name: "index_tournament_fighters_on_fighter_id"
    t.index ["tournament_id", "fighter_id"], name: "index_tournament_fighters_on_tournament_id_and_fighter_id", unique: true
    t.index ["tournament_id"], name: "index_tournament_fighters_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "date",       null: false
    t.string   "weapon",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_tournaments_on_date"
    t.index ["name", "date"], name: "index_tournaments_on_name_and_date", unique: true
    t.index ["name"], name: "index_tournaments_on_name"
  end

end
