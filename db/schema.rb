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

ActiveRecord::Schema[7.0].define(version: 2024_02_11_143346) do
  create_table "add_cash_points_logs", charset: "utf8mb3", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "reason", null: false
    t.integer "cash_points", null: false
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "download_links", charset: "utf8mb3", force: :cascade do |t|
    t.integer "provider", null: false
    t.string "link", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_informations_logs", charset: "utf8mb3", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "field"
    t.string "old_value"
    t.string "new_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
