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

ActiveRecord::Schema.define(version: 2019_06_05_192049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.string "highschool"
    t.string "faculty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "department"
    t.integer "year_of_start"
    t.integer "year_of_end"
    t.string "english"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "country_code"
    t.string "city"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telephone"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "sphere"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skill_levels", force: :cascade do |t|
    t.integer "level"
    t.bigint "user_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skill_levels_on_skill_id"
    t.index ["user_id"], name: "index_user_skill_levels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "educations", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_skill_levels", "skills"
  add_foreign_key "user_skill_levels", "users"
end
