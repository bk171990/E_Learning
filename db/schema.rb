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

ActiveRecord::Schema.define(version: 20171223131739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phonenumber"
    t.string "password"
    t.string "confirm_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admin_referral_code"
  end

  create_table "answers", force: :cascade do |t|
    t.string "body"
    t.bigint "query_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["query_id"], name: "index_answers_on_query_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_comments_on_course_id"
  end

  create_table "coupon_courses", force: :cascade do |t|
    t.bigint "coupon_id"
    t.bigint "course_id"
    t.string "coupon_course_category"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupon_courses_on_coupon_id"
    t.index ["course_id"], name: "index_coupon_courses_on_course_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "coupon_name"
    t.integer "discount"
    t.string "coupon_description"
    t.string "coupon_discount_code"
    t.date "valid_from"
    t.date "valid_until"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_coupons_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "course_description"
    t.date "course_validity"
    t.string "status"
    t.string "batch"
    t.date "admission_start_date"
    t.date "admission_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fees"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "general_settings", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.bigint "coupon_id"
    t.string "payment_status"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remaining_fees"
    t.string "instalment_fees"
    t.string "instalment"
    t.string "remaining"
    t.string "txnid"
    t.string "amount"
    t.string "status"
    t.string "access_token"
    t.string "email"
    t.string "fees"
    t.index ["coupon_id"], name: "index_payments_on_coupon_id"
    t.index ["course_id"], name: "index_payments_on_course_id"
    t.index ["student_id"], name: "index_payments_on_student_id"
  end

  create_table "queries", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "student_id"
    t.index ["student_id"], name: "index_queries_on_student_id"
    t.index ["user_id"], name: "index_queries_on_user_id"
  end

  create_table "question_types", force: :cascade do |t|
    t.string "ques_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "no_of_option"
    t.integer "question_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "middlename"
    t.string "lastname"
    t.date "dob"
    t.text "address"
    t.text "landmark"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "pincode"
    t.string "referral_code"
    t.string "course"
    t.time "duration"
    t.string "phone_number"
    t.string "image"
    t.string "coupon_code"
    t.string "email"
    t.string "password"
    t.string "conf_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.string "stud_no"
    t.string "txnid"
    t.string "amount"
    t.string "payment_status"
    t.string "access_token"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.date "dob"
    t.text "address"
    t.text "landmark"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "pincode"
    t.string "referral_code"
    t.string "course"
    t.time "duration"
    t.integer "phone_number"
    t.string "image"
    t.string "coupon_code"
    t.string "conf_password"
    t.boolean "status"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "phone_no"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "general_setting_id"
    t.string "role"
    t.bigint "admin_id"
    t.integer "student_id"
    t.index ["admin_id"], name: "index_users_on_admin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["general_setting_id"], name: "index_users_on_general_setting_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "queries"
  add_foreign_key "comments", "courses"
  add_foreign_key "coupon_courses", "coupons"
  add_foreign_key "coupon_courses", "courses"
  add_foreign_key "coupons", "courses"
  add_foreign_key "payments", "coupons"
  add_foreign_key "payments", "courses"
  add_foreign_key "payments", "students"
  add_foreign_key "queries", "students"
  add_foreign_key "queries", "users"
  add_foreign_key "users", "admins"
  add_foreign_key "users", "general_settings"
end
