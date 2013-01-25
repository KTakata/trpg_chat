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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130125150815) do

  create_table "battle_maps", :force => true do |t|
    t.integer  "t_session_id"
    t.integer  "size_h"
    t.integer  "size_w"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "size"
  end

  create_table "character_places", :force => true do |t|
    t.integer  "battle_map_id"
    t.string   "character_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "characters", :force => true do |t|
    t.integer  "player_id",                    :limit => 255
    t.string   "chara_type"
    t.string   "name"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "character_sheet_file_name"
    t.integer  "character_sheet_file_size"
    t.string   "character_sheet_content_type"
    t.datetime "character_sheet_updated_at"
  end

  create_table "gms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "t_sesstion_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "user_id"
    t.integer  "t_session_id"
    t.string   "player_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "player_status"
    t.integer  "character_id"
  end

  create_table "t_logs", :force => true do |t|
    t.string   "body"
    t.integer  "owner_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "t_session_id"
    t.integer  "many"
    t.integer  "d_type"
    t.integer  "score"
    t.string   "log_type"
    t.integer  "move_side"
    t.integer  "move_vertical"
    t.string   "npc_chara_name"
  end

  create_table "t_sessions", :force => true do |t|
    t.string   "system_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "scenario_name"
    t.string   "t_session_status"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "nick_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
