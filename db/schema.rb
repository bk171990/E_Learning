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

ActiveRecord::Schema.define(version: 20171114045430) do

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
  end

  create_table "general_settings", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
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
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["admin_id"], name: "index_users_on_admin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["general_setting_id"], name: "index_users_on_general_setting_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "users", "admins"
  add_foreign_key "users", "general_settings"
end
