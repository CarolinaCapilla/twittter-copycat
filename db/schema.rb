# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_13_095755) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index %w[blob_id], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id],
            name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index %w[key], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'comment'
    t.integer 'user_id', null: false
    t.integer 'tweeet_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[tweeet_id], name: 'index_comments_on_tweeet_id'
    t.index %w[user_id], name: 'index_comments_on_user_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.string 'favoritable_type', null: false
    t.integer 'favoritable_id', null: false
    t.string 'favoritor_type', null: false
    t.integer 'favoritor_id', null: false
    t.string 'scope', default: 'favorite', null: false
    t.boolean 'blocked', default: false, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[blocked], name: 'index_favorites_on_blocked'
    t.index %w[favoritable_id favoritable_type], name: 'fk_favoritables'
    t.index %w[favoritable_type favoritable_id],
            name: 'index_favorites_on_favoritable_type_and_favoritable_id'
    t.index %w[favoritor_id favoritor_type], name: 'fk_favorites'
    t.index %w[favoritor_type favoritor_id],
            name: 'index_favorites_on_favoritor_type_and_favoritor_id'
    t.index %w[scope], name: 'index_favorites_on_scope'
  end

  create_table 'tweeets', force: :cascade do |t|
    t.text 'tweeet'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id'
    t.index %w[user_id], name: 'index_tweeets_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.string 'username'
    t.index %w[email], name: 'index_users_on_email', unique: true
    t.index %w[reset_password_token],
            name: 'index_users_on_reset_password_token', unique: true
    t.index %w[username], name: 'index_users_on_username', unique: true
  end

  add_foreign_key 'active_storage_attachments',
                  'active_storage_blobs',
                  column: 'blob_id'
  add_foreign_key 'comments', 'tweeets'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'tweeets', 'users'
end
