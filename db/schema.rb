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

ActiveRecord::Schema.define(version: 2019_08_29_112147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "city"
    t.string "tod"
    t.integer "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_categories_on_activity_id"
    t.index ["category_id"], name: "index_activity_categories_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "user_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_reviews_on_activity_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shortlisted_activities", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day"
    t.index ["activity_id"], name: "index_shortlisted_activities_on_activity_id"
    t.index ["trip_id"], name: "index_shortlisted_activities_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id"
    t.string "trip_name"
    t.integer "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "duration"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "second_name"
    t.string "username"
    t.string "nationality"
    t.text "bio"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "users"
  add_foreign_key "activity_categories", "activities"
  add_foreign_key "activity_categories", "categories"
  add_foreign_key "reviews", "activities"
  add_foreign_key "reviews", "users"
  add_foreign_key "shortlisted_activities", "activities"
  add_foreign_key "shortlisted_activities", "trips"
  add_foreign_key "trips", "users"
end
