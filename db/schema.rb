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

ActiveRecord::Schema.define(version: 2018_08_01_073040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diabetes", force: :cascade do |t|
    t.float "fasting_blood_glucose"
    t.float "hg1ac"
    t.integer "meal"
    t.float "blood_glucose_level"
    t.string "medication"
    t.string "notes"
    t.bigint "health_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_record_id"], name: "index_diabetes_on_health_record_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "health_records", force: :cascade do |t|
    t.bigint "patient_id"
    t.boolean "obese", default: false
    t.boolean "diabete", default: false
    t.boolean "hypertension", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_health_records_on_patient_id"
  end

  create_table "hypertensions", force: :cascade do |t|
    t.float "SBP"
    t.float "DBP"
    t.string "medication"
    t.string "notes"
    t.bigint "health_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_record_id"], name: "index_hypertensions_on_health_record_id"
  end

  create_table "obeses", force: :cascade do |t|
    t.float "bmi"
    t.float "waist_circumference"
    t.string "notes"
    t.string "medication"
    t.bigint "health_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "weight"
    t.float "height"
    t.index ["health_record_id"], name: "index_obeses_on_health_record_id"
  end

  create_table "patient_prizes", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "prize_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_prizes_on_patient_id"
    t.index ["prize_id"], name: "index_patient_prizes_on_prize_id"
  end

  create_table "patients", force: :cascade do |t|
    t.float "height"
    t.float "weight"
    t.string "blood_type"
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "cost"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "ic"
    t.string "gender"
    t.string "phone"
    t.string "email"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "doctors", "users"
  add_foreign_key "health_records", "patients"
  add_foreign_key "patient_prizes", "patients"
  add_foreign_key "patient_prizes", "prizes"
end
