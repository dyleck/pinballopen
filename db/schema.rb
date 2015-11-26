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

ActiveRecord::Schema.define(version: 20151124202725) do

  create_table "matches", force: true do |t|
    t.integer  "table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round_id"
  end

  add_index "matches", ["round_id"], name: "index_matches_on_round_id"
  add_index "matches", ["table_id"], name: "index_matches_on_table_id"

  create_table "nationalities", force: true do |t|
    t.string   "name"
    t.string   "flag_img_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phases", force: true do |t|
    t.integer  "number_of_rounds"
    t.integer  "matches_per_round"
    t.integer  "players_per_round"
    t.boolean  "player_fixed"
    t.boolean  "phase_fixed"
    t.integer  "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "phases_users", force: true do |t|
    t.integer "phase_id"
    t.integer "user_id"
  end

  add_index "phases_users", ["phase_id"], name: "index_phases_users_on_phase_id"
  add_index "phases_users", ["user_id"], name: "index_phases_users_on_user_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id"

  create_table "rounds", force: true do |t|
    t.integer  "phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rounds", ["phase_id"], name: "index_rounds_on_phase_id"

  create_table "scores", force: true do |t|
    t.integer "value",    default: 0
    t.integer "match_id"
    t.integer "user_id"
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id"
  add_index "scores", ["user_id"], name: "index_scores_on_user_id"

  create_table "tables", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_phase", default: 0
  end

  create_table "tournaments_users", force: true do |t|
    t.integer "tournament_id"
    t.integer "user_id"
  end

  add_index "tournaments_users", ["tournament_id"], name: "index_tournaments_users_on_tournament_id"
  add_index "tournaments_users", ["user_id"], name: "index_tournaments_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "nationality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "password_digest"
    t.text     "email",           default: "f"
    t.boolean  "active"
    t.string   "token"
  end

  add_index "users", ["nationality_id"], name: "index_users_on_nationality_id"

end
