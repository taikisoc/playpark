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

ActiveRecord::Schema.define(version: 20150323120144) do

  create_table "activities", force: :cascade do |t|
    t.string   "event_place",              limit: 255
    t.string   "event_station",            limit: 255
    t.integer  "event_people",             limit: 4
    t.string   "event_bring",              limit: 255
    t.text     "event_else",               limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "event_time",               limit: 255
    t.string   "event_date",               limit: 255
    t.text     "event_what",               limit: 65535
    t.string   "event_img1_file_name",     limit: 255
    t.string   "event_img1_content_type",  limit: 255
    t.integer  "event_img1_file_size",     limit: 4
    t.datetime "event_img1_updated_at"
    t.string   "event_img2_file_name",     limit: 255
    t.string   "event_img2_content_type",  limit: 255
    t.integer  "event_img2_file_size",     limit: 4
    t.datetime "event_img2_updated_at"
    t.string   "event_img3_file_name",     limit: 255
    t.string   "event_img3_content_type",  limit: 255
    t.integer  "event_img3_file_size",     limit: 4
    t.datetime "event_img3_updated_at"
    t.string   "event_p_img_file_name",    limit: 255
    t.string   "event_p_img_content_type", limit: 255
    t.integer  "event_p_img_file_size",    limit: 4
    t.datetime "event_p_img_updated_at"
  end

  create_table "appointments", force: :cascade do |t|
    t.string   "ask_about",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "introduction", limit: 65535
    t.string   "where_go",     limit: 255
    t.string   "send_user",    limit: 255
    t.string   "recieve_user", limit: 255
  end

  add_index "appointments", ["created_at"], name: "naakne", using: :btree

  create_table "nextacts", force: :cascade do |t|
    t.string   "event_place",                 limit: 255
    t.text     "event_what",                  limit: 65535
    t.date     "event_date"
    t.string   "event_time",                  limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "next_event_img_file_name",    limit: 255
    t.string   "next_event_img_content_type", limit: 255
    t.integer  "next_event_img_file_size",    limit: 4
    t.datetime "next_event_img_updated_at"
  end

  create_table "parks", force: :cascade do |t|
    t.string   "park_name",  limit: 255
    t.text     "image_url",  limit: 65535
    t.string   "station",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "uuid",       limit: 255, null: false
    t.datetime "expired_at",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname",               limit: 255
    t.integer  "separate",               limit: 4
    t.string   "fullname",               limit: 255
    t.string   "hobby_1",                limit: 255
    t.string   "hobby_2",                limit: 255
    t.string   "hobby_3",                limit: 255
    t.string   "introduction",           limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "administrator",          limit: 4
    t.integer  "permission",             limit: 4
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "token",                  limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
