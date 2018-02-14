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

ActiveRecord::Schema.define(version: 20180208073325) do

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
    t.integer "question_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_comments_on_course_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "exam_answers", force: :cascade do |t|
    t.string "description"
    t.bigint "exam_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_question_id"], name: "index_exam_answers_on_exam_question_id"
  end

  create_table "exam_questions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question_type"
    t.bigint "examination_id"
    t.bigint "question_database_id"
    t.index ["examination_id"], name: "index_exam_questions_on_examination_id"
    t.index ["question_database_id"], name: "index_exam_questions_on_question_database_id"
  end

  create_table "examinations", force: :cascade do |t|
    t.string "exam_name"
    t.string "description"
    t.time "time_for_question"
    t.string "total_no_of_question"
    t.string "total_time_for_exam"
    t.string "mark_per_question"
    t.string "total_marks_of_question"
    t.string "publish_exam_time_and_date"
    t.string "exam_rules_and_regulations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exam_question_id"
    t.bigint "student_score_id"
    t.index ["exam_question_id"], name: "index_examinations_on_exam_question_id"
    t.index ["student_score_id"], name: "index_examinations_on_student_score_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
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

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.string "is_answer"
    t.bigint "exam_questions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exam_question_id"
    t.bigint "question_database_id"
    t.index ["exam_question_id"], name: "index_options_on_exam_question_id"
    t.index ["exam_questions_id"], name: "index_options_on_exam_questions_id"
    t.index ["question_database_id"], name: "index_options_on_question_database_id"
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

  create_table "placement_exams", force: :cascade do |t|
    t.string "question_count"
    t.time "timeperiod"
    t.date "start_date"
    t.date "end_date"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_placement_exams_on_company_id"
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

  create_table "question_databases", force: :cascade do |t|
    t.bigint "question_type_id"
    t.string "question"
    t.string "no_of_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_type_id"], name: "index_question_databases_on_question_type_id"
  end

  create_table "question_types", force: :cascade do |t|
    t.string "que_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "exam_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.string "name"
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_answer_sheets", force: :cascade do |t|
    t.bigint "student_exams_id"
    t.bigint "options_id"
    t.bigint "exam_questions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_questions_id"], name: "index_student_answer_sheets_on_exam_questions_id"
    t.index ["options_id"], name: "index_student_answer_sheets_on_options_id"
    t.index ["student_exams_id"], name: "index_student_answer_sheets_on_student_exams_id"
  end

  create_table "student_exams", force: :cascade do |t|
    t.bigint "examination_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_student_exams_on_examination_id"
    t.index ["student_id"], name: "index_student_exams_on_student_id"
  end

  create_table "student_scores", force: :cascade do |t|
    t.float "score"
    t.bigint "examination_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_student_scores_on_examination_id"
    t.index ["student_id"], name: "index_student_scores_on_student_id"
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
    t.string "referenced_by"
    t.integer "course_id"
  end

  create_table "sub_courses", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_sub_courses_on_course_id"
  end

  create_table "survey_answers", force: :cascade do |t|
    t.integer "attempt_id"
    t.integer "question_id"
    t.integer "option_id"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_attempts", force: :cascade do |t|
    t.string "participant_type"
    t.bigint "participant_id"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
    t.index ["participant_type", "participant_id"], name: "index_survey_attempts_on_participant_type_and_participant_id"
  end

  create_table "survey_options", force: :cascade do |t|
    t.integer "question_id"
    t.integer "weight", default: 0
    t.string "text"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer "survey_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_surveys", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "attempts_number", default: 0
    t.boolean "finished", default: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "survey_type"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "attempts_number", default: 0
    t.boolean "finished", default: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "survey_type"
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
    t.string "referenced_by"
    t.string "auth_token"
    t.index ["admin_id"], name: "index_users_on_admin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["general_setting_id"], name: "index_users_on_general_setting_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weightages", force: :cascade do |t|
    t.string "percentage"
    t.bigint "examination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_type_id"
    t.bigint "placement_exam_id"
    t.index ["examination_id"], name: "index_weightages_on_examination_id"
    t.index ["placement_exam_id"], name: "index_weightages_on_placement_exam_id"
    t.index ["question_type_id"], name: "index_weightages_on_question_type_id"
  end

  add_foreign_key "comments", "courses"
  add_foreign_key "coupon_courses", "coupons"
  add_foreign_key "coupon_courses", "courses"
  add_foreign_key "coupons", "courses"
  add_foreign_key "exam_answers", "exam_questions"
  add_foreign_key "exam_questions", "examinations"
  add_foreign_key "exam_questions", "question_databases"
  add_foreign_key "examinations", "exam_questions"
  add_foreign_key "examinations", "student_scores"
  add_foreign_key "options", "exam_questions"
  add_foreign_key "options", "exam_questions", column: "exam_questions_id"
  add_foreign_key "options", "question_databases"
  add_foreign_key "payments", "coupons"
  add_foreign_key "payments", "courses"
  add_foreign_key "payments", "students"
  add_foreign_key "placement_exams", "companies"
  add_foreign_key "queries", "students"
  add_foreign_key "queries", "users"
  add_foreign_key "question_databases", "question_types"
  add_foreign_key "student_answer_sheets", "exam_questions", column: "exam_questions_id"
  add_foreign_key "student_answer_sheets", "options", column: "options_id"
  add_foreign_key "student_answer_sheets", "student_exams", column: "student_exams_id"
  add_foreign_key "student_exams", "examinations"
  add_foreign_key "student_exams", "students"
  add_foreign_key "student_scores", "examinations"
  add_foreign_key "student_scores", "students"
  add_foreign_key "sub_courses", "courses"
  add_foreign_key "users", "admins"
  add_foreign_key "users", "general_settings"
  add_foreign_key "weightages", "examinations"
  add_foreign_key "weightages", "placement_exams"
  add_foreign_key "weightages", "question_types"
end
