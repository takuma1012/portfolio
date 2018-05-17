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

ActiveRecord::Schema.define(version: 20180515230105) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "article_histories", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "history_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_histories_on_article_id"
    t.index ["history_id"], name: "index_article_histories_on_history_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "article_name", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.date "release_date", null: false
    t.string "article_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_blogs_on_admin_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "prefecture"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture"], name: "index_deliveries_on_prefecture"
    t.index ["price"], name: "index_deliveries_on_price"
  end

  create_table "histories", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building"
    t.string "phone", null: false
    t.string "email", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.string "payment"
    t.string "status", default: "未配送"
    t.string "pay_status"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "admin_id"
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_interviews_on_admin_id"
  end

  create_table "lyrics", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "track_id", null: false
    t.integer "admin_id", null: false
    t.text "lyric", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_lyrics_on_admin_id"
    t.index ["article_id"], name: "index_lyrics_on_article_id"
    t.index ["track_id"], name: "index_lyrics_on_track_id"
  end

  create_table "main_pages", force: :cascade do |t|
    t.string "main_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offshots", force: :cascade do |t|
    t.string "offshot_image_id", null: false
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_offshots_on_admin_id"
  end

  create_table "topics", force: :cascade do |t|
    t.text "notice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "article_id", null: false
    t.string "track_name", null: false
    t.integer "track_num", null: false
    t.string "lyric"
    t.string "composer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_tracks_on_article_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "nick_name"
    t.string "last_name"
    t.string "last_name_kana"
    t.string "first_name"
    t.string "first_name_kana"
    t.datetime "soft_destroyed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.boolean "mail_flg", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["soft_destroyed_at"], name: "index_users_on_soft_destroyed_at"
  end

end
