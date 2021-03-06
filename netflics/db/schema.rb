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

ActiveRecord::Schema.define(version: 20170625195622) do

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "tag"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "title"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "movie_id"
    t.integer  "season"
  end

  create_table "children", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "role"
    t.string   "name"
    t.boolean  "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "country"
    t.string   "language"
    t.text     "actor"
    t.string   "director"
    t.integer  "n_chapter"
    t.integer  "n_season"
    t.date     "start_year"
    t.date     "finish_year"
    t.datetime "date_update"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "creator"
    t.integer  "category_id"
    t.string   "movie_img_file_name"
    t.string   "movie_img_content_type"
    t.integer  "movie_img_file_size"
    t.datetime "movie_img_updated_at"
    t.integer  "chapter_id"
  end

  create_table "news", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "role",                   default: "common", null: false
    t.string   "name",                   default: "",       null: false
    t.string   "lastname",               default: "",       null: false
    t.string   "watchedseries"
    t.string   "watchedchapters"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
