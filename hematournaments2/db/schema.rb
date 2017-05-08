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

ActiveRecord::Schema.define(version: 20170507195825) do

  create_table "fighters", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name"
    t.string   "club"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name"], name: "index_fighters_on_first_name_and_last_name", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "pool_id",         null: false
    t.integer  "order",           null: false
    t.integer  "red_fighter_id",  null: false
    t.integer  "blue_fighter_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["blue_fighter_id"], name: "index_matches_on_blue_fighter_id"
    t.index ["pool_id"], name: "index_matches_on_pool_id"
    t.index ["red_fighter_id"], name: "index_matches_on_red_fighter_id"
  end

  create_table "pool_fighters", force: :cascade do |t|
    t.integer  "pool_id",    null: false
    t.integer  "fighter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fighter_id"], name: "index_pool_fighters_on_fighter_id"
    t.index ["pool_id", "fighter_id"], name: "index_pool_fighters_on_pool_id_and_fighter_id", unique: true
    t.index ["pool_id"], name: "index_pool_fighters_on_pool_id"
  end

  create_table "pools", force: :cascade do |t|
    t.integer  "tournament_id", null: false
    t.string   "name",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_pools_on_tournament_id"
  end

  create_table "rule_set_rules", force: :cascade do |t|
    t.integer  "rule_set_id", null: false
    t.integer  "rule_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["rule_id"], name: "index_rule_set_rules_on_rule_id"
    t.index ["rule_set_id", "rule_id"], name: "index_rule_set_rules_on_rule_set_id_and_rule_id", unique: true
    t.index ["rule_set_id"], name: "index_rule_set_rules_on_rule_set_id"
  end

  create_table "rule_sets", force: :cascade do |t|
    t.string   "description"
    t.string   "weapon"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.index ["id"], name: "index_rule_sets_on_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string   "target",     null: false
    t.integer  "points",     null: false
    t.boolean  "is_penalty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_rules_on_id"
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
