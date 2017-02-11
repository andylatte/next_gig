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

ActiveRecord::Schema.define(version: 20170211142134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargos", force: :cascade do |t|
    t.string   "time_drop_off"
    t.string   "contact_drop_off"
    t.string   "licence_plate_drop_off"
    t.string   "amount_drop_off"
    t.text     "comment_drop_off"
    t.string   "time_pick_up"
    t.string   "contact_pick_up"
    t.string   "licence_plate_pick_up"
    t.string   "amount_pick_up"
    t.text     "comment_pick_up"
    t.integer  "tour_day_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["tour_day_id"], name: "index_cargos_on_tour_day_id", using: :btree
  end

  create_table "crew_memberships", force: :cascade do |t|
    t.integer  "tour_manager_id"
    t.integer  "crew_member_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tour_manager_id"], name: "index_crew_memberships_on_tour_manager_id", using: :btree
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "hotel_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.date     "check_in_date"
    t.date     "check_out_date"
    t.integer  "number_of_nights"
    t.string   "single_rooms"
    t.string   "twin_rooms"
    t.string   "breakfast"
    t.text     "comment"
    t.string   "type"
    t.integer  "tour_day_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tour_day_id"], name: "index_hotels_on_tour_day_id", using: :btree
  end

  create_table "productions", force: :cascade do |t|
    t.string   "main_contact_name"
    t.string   "main_contact_phone"
    t.string   "main_contact_email"
    t.string   "prod_contact_name"
    t.string   "prod_contact_phone"
    t.string   "prod_contact_email"
    t.string   "hosp_contact_name"
    t.string   "hosp_contact_phone"
    t.string   "hosp_contact_email"
    t.string   "stage_manager_name"
    t.string   "stage_manager_phone"
    t.string   "stage_manager_email"
    t.string   "stage_size"
    t.string   "local_backline"
    t.text     "access_notes"
    t.text     "loading_notes"
    t.text     "credential_notes"
    t.text     "comment"
    t.integer  "tour_day_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["tour_day_id"], name: "index_productions_on_tour_day_id", using: :btree
  end

  create_table "schedule_items", force: :cascade do |t|
    t.string   "name"
    t.string   "for_whom"
    t.string   "number"
    t.string   "origin"
    t.string   "destination"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "departure_datetime"
    t.datetime "arrival_datetime"
    t.string   "duration"
    t.string   "contact"
    t.string   "comment"
    t.string   "type"
    t.integer  "tour_day_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["tour_day_id"], name: "index_schedule_items_on_tour_day_id", using: :btree
  end

  create_table "tour_days", force: :cascade do |t|
    t.date     "date"
    t.string   "show_name"
    t.string   "km_next_day"
    t.text     "comment_next_day"
    t.string   "city"
    t.string   "country"
    t.string   "time_zone"
    t.integer  "tour_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tour_id"], name: "index_tour_days_on_tour_id", using: :btree
  end

  create_table "tour_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_tour_memberships_on_tour_id", using: :btree
    t.index ["user_id"], name: "index_tour_memberships_on_user_id", using: :btree
  end

  create_table "tours", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "tour_name"
    t.string   "band_name"
    t.integer  "tour_days_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_tours_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "is_admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.string   "venue_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "url"
    t.string   "venue_type"
    t.string   "slot"
    t.string   "stage"
    t.string   "capacity"
    t.string   "sales"
    t.text     "comment"
    t.integer  "tour_day_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["tour_day_id"], name: "index_venues_on_tour_day_id", using: :btree
  end

end
