# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_18_204450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "call_detail_records", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "contact_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "agent_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_call_detail_records_on_account_id"
    t.index ["agent_id"], name: "index_call_detail_records_on_agent_id"
    t.index ["contact_id"], name: "index_call_detail_records_on_contact_id"
  end

  create_table "calls", force: :cascade do |t|
    t.string "caller_phone_number"
    t.string "receiver_phone_number"
    t.string "call_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "agent_answer_time"
    t.integer "duration"
    t.bigint "account_id", null: false
    t.bigint "contact_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_calls_on_account_id"
    t.index ["agent_id"], name: "index_calls_on_agent_id"
    t.index ["contact_id"], name: "index_calls_on_contact_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_contacts_on_account_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "photo"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "call_detail_records", "accounts"
  add_foreign_key "call_detail_records", "agents"
  add_foreign_key "call_detail_records", "contacts"
  add_foreign_key "calls", "accounts"
  add_foreign_key "calls", "agents"
  add_foreign_key "calls", "contacts"
  add_foreign_key "contacts", "accounts"
  add_foreign_key "users", "accounts"
end
