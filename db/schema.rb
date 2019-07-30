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

ActiveRecord::Schema.define(version: 2019_07_29_043203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "admin_users", force: :cascade do |t|
    t.string "fullname", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "role_id"
    t.string "avatar"
    t.string "bio"
    t.boolean "delete_flg", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_admin_users_on_role_id"
  end

  create_table "blog_hashtags", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "hashtag_id"
    t.index ["blog_id"], name: "index_blog_hashtags_on_blog_id"
    t.index ["hashtag_id"], name: "index_blog_hashtags_on_hashtag_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.integer "impressions_count", default: 0
    t.bigint "admin_user_id"
    t.string "title"
    t.text "short_description"
    t.text "content"
    t.index ["admin_user_id"], name: "index_blogs_on_admin_user_id"
    t.index ["location_id"], name: "index_blogs_on_location_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "first_choice"
    t.string "second_choice"
    t.string "third_choice"
    t.integer "numAdults"
    t.boolean "interpreter", default: false
    t.bigint "experience_id"
    t.string "guest_firstnam"
    t.string "guest_lastname"
    t.string "guest_title"
    t.integer "age"
    t.string "nationality"
    t.string "language"
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.string "representative_firstname"
    t.string "representative_lastname"
    t.string "representative_title"
    t.string "representative_email"
    t.boolean "send_mail_only_representative", default: false
    t.integer "total"
    t.integer "numChildren"
    t.integer "numInfants"
    t.index ["experience_id"], name: "index_bookings_on_experience_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
  end

  create_table "category_blogs", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "category_id"
    t.index ["blog_id"], name: "index_category_blogs_on_blog_id"
    t.index ["category_id"], name: "index_category_blogs_on_category_id"
  end

  create_table "category_experiences", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "experience_id"
    t.index ["category_id"], name: "index_category_experiences_on_category_id"
    t.index ["experience_id"], name: "index_category_experiences_on_experience_id"
  end

  create_table "experience_dates", force: :cascade do |t|
    t.date "expFrom"
    t.date "expTo"
    t.integer "month"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "experience_id"
    t.index ["experience_id"], name: "index_experience_dates_on_experience_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.decimal "price_adult"
    t.decimal "price_children"
    t.decimal "price_infant"
    t.string "duration"
    t.string "age"
    t.string "language"
    t.text "short_description"
    t.text "description"
    t.bigint "admin_user_id"
    t.index ["admin_user_id"], name: "index_experiences_on_admin_user_id"
    t.index ["location_id"], name: "index_experiences_on_location_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "province"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogs", "admin_users"
  add_foreign_key "bookings", "experiences"
  add_foreign_key "category_experiences", "categories"
  add_foreign_key "category_experiences", "experiences"
  add_foreign_key "experiences", "locations"
end
