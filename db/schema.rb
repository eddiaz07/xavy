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

ActiveRecord::Schema.define(version: 2018_10_05_005915) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.integer "venue_id"
    t.string "name"
    t.text "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "hardness"
    t.index ["venue_id"], name: "index_activities_on_venue_id"
  end

  create_table "activities_tags", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "tag_id"
    t.index ["activity_id"], name: "index_activities_tags_on_activity_id"
    t.index ["tag_id"], name: "index_activities_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_activities", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "tag_id"
    t.index ["activity_id"], name: "index_tags_activities_on_activity_id"
    t.index ["tag_id"], name: "index_tags_activities_on_tag_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
  end

end
