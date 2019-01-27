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

ActiveRecord::Schema.define(version: 2019_01_27_161646) do

  create_table "hotel_tables", force: :cascade do |t|
    t.integer "hotel_id"
    t.string "name"
    t.integer "min_seats"
    t.integer "max_seats"
    t.boolean "booked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_hotel_tables_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hotel_id"
    t.integer "hotel_table_id"
    t.date "booking_date"
    t.time "booking_from"
    t.time "booking_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_of_users"
    t.string "shift_type"
    t.index ["hotel_id"], name: "index_reservations_on_hotel_id"
    t.index ["hotel_table_id"], name: "index_reservations_on_hotel_table_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
