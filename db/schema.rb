# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_21_132011) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.text "address"
    t.string "phone"
    t.string "web"
    t.string "ava"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "company_people", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "person_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_people_on_company_id"
    t.index ["person_id"], name: "index_company_people_on_person_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "title"
    t.date "start"
    t.date "finish"
    t.text "description"
    t.integer "stage", default: 0
    t.integer "status", default: 0
    t.bigint "company_id", null: false
    t.bigint "person_id", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_opportunities_on_company_id"
    t.index ["person_id"], name: "index_opportunities_on_person_id"
    t.index ["user_id"], name: "index_opportunities_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "phone"
    t.string "facebook"
    t.string "twitter"
    t.string "web"
    t.string "email"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ava"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "company_people", "companies"
  add_foreign_key "company_people", "people"
  add_foreign_key "opportunities", "companies"
  add_foreign_key "opportunities", "people"
  add_foreign_key "opportunities", "users"
  add_foreign_key "people", "users"
end
