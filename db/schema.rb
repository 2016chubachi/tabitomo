# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161030122048) do

  create_table "booking_comments", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "comment"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_schedules", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "traveler_count"
    t.integer  "city_master_id"
    t.datetime "traveler_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "status_master_id"
    t.integer  "traveler_id"
    t.integer  "guide_id"
    t.string   "traveler_first_name"
    t.string   "traveler_last_name"
    t.string   "traveler_email"
    t.string   "traveler_telphone"
    t.string   "traveler_country"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "city_masters", force: :cascade do |t|
    t.string   "text_ja"
    t.string   "text_en"
    t.string   "text_ko"
    t.string   "text_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "text_ja"
    t.string   "text_en"
    t.string   "text_ko"
    t.string   "text_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guide_cities", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "city_master_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "guide_languages", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "language_code_id"
    t.integer  "language_skill_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "guides", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "experience"
    t.integer  "birth_year"
    t.string   "profile"
    t.string   "guide_service"
    t.string   "guide_transportation"
    t.string   "guide_interest"
    t.integer  "license_flg"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "language_codes", force: :cascade do |t|
    t.string   "text_ja"
    t.string   "text_en"
    t.string   "text_ko"
    t.string   "text_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_skills", force: :cascade do |t|
    t.string   "text_ja"
    t.string   "text_en"
    t.string   "text_ko"
    t.string   "text_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licence_pictures", force: :cascade do |t|
    t.string   "pictype"
    t.binary   "image"
    t.integer  "guide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_pictures", force: :cascade do |t|
    t.string   "pictype"
    t.binary   "image"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.integer  "country_id"
    t.string   "telphone"
    t.integer  "gender"
    t.string   "hantei"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "members", ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true
  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  add_index "members", ["unlock_token"], name: "index_members_on_unlock_token", unique: true

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "star_masters", force: :cascade do |t|
    t.string   "pictype"
    t.binary   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_masters", force: :cascade do |t|
    t.string   "text_ja"
    t.string   "text_en"
    t.string   "text_ko"
    t.string   "text_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traveler_booking_comments", force: :cascade do |t|
    t.integer  "traveler_id"
    t.string   "comment"
    t.integer  "booking_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "travelers", force: :cascade do |t|
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reviews", force: :cascade do |t|
    t.integer  "star_master_id"
    t.string   "title"
    t.string   "detail"
    t.integer  "booking_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
