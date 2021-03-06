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

ActiveRecord::Schema.define(version: 2019_02_18_051136) do

  create_table "games", force: :cascade do |t|
    t.date "played_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "buy_in", default: 20
    t.integer "money_places", default: 3
    t.integer "base_point_number", default: 1
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0
    t.integer "net_money", default: 0
    t.integer "top_place", default: 0
    t.integer "wins", default: 0
    t.float "win_percentage", default: 0.0
    t.integer "heads_up", default: 0
    t.integer "games_played", default: 0
  end

  create_table "results", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.integer "winnings", default: 0
    t.index ["game_id"], name: "index_results_on_game_id"
    t.index ["player_id"], name: "index_results_on_player_id"
  end

end
