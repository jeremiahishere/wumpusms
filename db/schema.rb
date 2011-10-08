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

ActiveRecord::Schema.define(:version => 20110723145119) do

  create_table "game_users", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gold_objects", :force => true do |t|
    t.integer  "amount"
    t.integer  "room_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hole_objects", :force => true do |t|
    t.integer  "room_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "room_id"
    t.string   "status"
    t.integer  "arrows"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "money"
  end

  create_table "room_connections", :force => true do |t|
    t.integer  "start_room_id"
    t.integer  "end_room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.integer  "coord_x"
    t.integer  "coord_y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "north_of_room_id"
    t.integer  "south_of_room_id"
    t.integer  "east_of_room_id"
    t.integer  "west_of_room_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wumpus_objects", :force => true do |t|
    t.integer  "room_id"
    t.integer  "game_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
