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

ActiveRecord::Schema.define(version: 20170131104500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crew_memberships", force: :cascade do |t|
    t.integer  "tour_manager_id"
    t.integer  "crew_member_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tour_manager_id"], name: "index_crew_memberships_on_tour_manager_id", using: :btree
  end

  create_table "tour_days", force: :cascade do |t|
    t.date     "date"
    t.string   "show_name"
    t.integer  "km_next_day"
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
    t.date     "first_show_day"
    t.date     "last_show_day"
    t.integer  "show_day_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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

end
