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

ActiveRecord::Schema.define(version: 20141202221725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "name",               null: false
    t.date     "release_date"
    t.text     "about"
    t.text     "credits"
    t.string   "privacy",            null: false
    t.integer  "band_id",            null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepicker_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id", using: :btree
  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "bands", force: true do |t|
    t.string   "name",               null: false
    t.string   "location"
    t.string   "website"
    t.string   "genre"
    t.text     "info"
    t.integer  "user_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepicker_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "bands", ["user_id"], name: "index_bands_on_user_id", using: :btree

  create_table "collections", force: true do |t|
    t.integer  "user_id"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["album_id"], name: "index_collections_on_album_id", using: :btree
  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "followings", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.string   "followed_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followings", ["followed_id"], name: "index_followings_on_followed_id", using: :btree
  add_index "followings", ["follower_id"], name: "index_followings_on_follower_id", using: :btree

  create_table "songs", force: true do |t|
    t.string   "title",              null: false
    t.date     "release_date"
    t.text     "about"
    t.text     "credits"
    t.string   "privacy"
    t.integer  "album_id"
    t.integer  "band_id",            null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepicker_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "track_file_name"
    t.string   "track_content_type"
    t.integer  "track_file_size"
    t.datetime "track_updated_at"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree
  add_index "songs", ["band_id"], name: "index_songs_on_band_id", using: :btree
  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "location"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",           null: false
    t.string   "filepicker_url"
    t.string   "omniauth_id"
  end

end
