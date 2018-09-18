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

ActiveRecord::Schema.define(version: 20180918032111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asignatures", force: :cascade do |t|
    t.string   "name"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_asignatures_on_institution_id", using: :btree
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
    t.index ["institution_id"], name: "index_classrooms_on_institution_id", using: :btree
  end

  create_table "contact_informations", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "email"
    t.string   "phone"
    t.string   "description"
    t.boolean  "receives_emails"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["student_id"], name: "index_contact_informations_on_student_id", using: :btree
  end

  create_table "course_schedules", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "day_id"
    t.integer  "start_at_id"
    t.integer  "end_at_id"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.index ["classroom_id"], name: "index_course_schedules_on_classroom_id", using: :btree
    t.index ["course_id"], name: "index_course_schedules_on_course_id", using: :btree
    t.index ["day_id"], name: "index_course_schedules_on_day_id", using: :btree
    t.index ["end_at_id"], name: "index_course_schedules_on_end_at_id", using: :btree
    t.index ["start_at_id"], name: "index_course_schedules_on_start_at_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "asignature_id"
    t.integer  "capacity"
    t.float    "duration"
    t.integer  "frecuency"
    t.integer  "price"
    t.integer  "charging_mode"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
    t.index ["asignature_id"], name: "index_courses_on_asignature_id", using: :btree
    t.index ["institution_id"], name: "index_courses_on_institution_id", using: :btree
  end

  create_table "days", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fees", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "month"
    t.integer  "total_to_pay"
    t.integer  "amount_paid"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "year"
    t.index ["student_id"], name: "index_fees_on_student_id", using: :btree
  end

  create_table "hours", force: :cascade do |t|
    t.string   "str_time"
    t.string   "seconds_since_midnight"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "institution_owners", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_institution_owners_on_user_id", using: :btree
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.integer  "institution_owner_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["institution_owner_id"], name: "index_institutions_on_institution_owner_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "description"
    t.integer  "price"
    t.integer  "asignature_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "fee_id"
    t.index ["asignature_id"], name: "index_items_on_asignature_id", using: :btree
    t.index ["fee_id"], name: "index_items_on_fee_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "day_id"
    t.integer  "hour_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
    t.index ["day_id"], name: "index_schedules_on_day_id", using: :btree
    t.index ["hour_id"], name: "index_schedules_on_hour_id", using: :btree
    t.index ["institution_id"], name: "index_schedules_on_institution_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.integer  "status"
    t.date     "start_date"
    t.integer  "user_id"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.index ["institution_id"], name: "index_students_on_institution_id", using: :btree
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.date     "start_date"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subscriptions_on_course_id", using: :btree
    t.index ["student_id"], name: "index_subscriptions_on_student_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.integer  "roles_mask"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "asignatures", "institutions"
  add_foreign_key "classrooms", "institutions"
  add_foreign_key "contact_informations", "students"
  add_foreign_key "course_schedules", "classrooms"
  add_foreign_key "course_schedules", "courses"
  add_foreign_key "course_schedules", "days"
  add_foreign_key "courses", "asignatures"
  add_foreign_key "courses", "institutions"
  add_foreign_key "fees", "students"
  add_foreign_key "institution_owners", "users"
  add_foreign_key "institutions", "institution_owners"
  add_foreign_key "items", "asignatures"
  add_foreign_key "items", "fees"
  add_foreign_key "schedules", "days"
  add_foreign_key "schedules", "hours"
  add_foreign_key "schedules", "institutions"
  add_foreign_key "students", "institutions"
  add_foreign_key "students", "users"
  add_foreign_key "subscriptions", "courses"
  add_foreign_key "subscriptions", "students"
end
