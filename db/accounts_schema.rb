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

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "accounts", primary_key: ["AccountID", "Username"], charset: "latin1", force: :cascade do |t|
    t.integer "AccountID", null: false, unsigned: true, auto_increment: true
    t.string "Username", limit: 16, null: false
    t.string "Password_hash", limit: 32, null: false, comment: "password in md5"
    t.column "acc_status", "enum('pending','block','active')", default: "active", null: false
    t.string "email", limit: 80, default: "test@mail.com", null: false
    t.integer "mallpoints", default: 0, null: false, unsigned: true
    t.timestamp "reg_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "last_login"
    t.string "reg_ip", limit: 15
    t.integer "admin", limit: 1, default: 0, null: false, comment: "value from 0 to 10"
    t.boolean "isGm", default: false, null: false, comment: "0 = normal user / 1 = game master or people with who can login in testing phase"
    t.integer "lastServerFarmId", limit: 1, default: 255, null: false, comment: "default: INVALID_SERVERFARMID ( 255 )", unsigned: true
    t.integer "founder", limit: 2, default: 0, null: false, comment: "0 = no founder / 1 = first founder / 2 = second / 3 = third"
    t.integer "founder_recv", limit: 2, default: 0, null: false, comment: "0 = founder not received / 1 = founder received"
    t.string "last_ip", limit: 16, default: "0.0.0.0", null: false
    t.string "del_char_pw", limit: 32, default: "25f9e794323b453885f5181f1b624d0b", null: false
    t.integer "PremiumSlots", limit: 1, default: 4, null: false, unsigned: true
    t.integer "EventCoins", default: 0, comment: "coins used to play on HLS event machine", unsigned: true
    t.integer "WaguCoins", default: 0, comment: "coins used to play on HLS slot machine", unsigned: true
    t.string "web_ip", limit: 15
    t.index ["AccountID"], name: "AccountID", unique: true
    t.index ["Username"], name: "Username", unique: true
  end

  create_table "accounts_banned", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "GM_AccId", default: 0, null: false, unsigned: true
    t.integer "Banned_AccId", default: 0, null: false, unsigned: true
    t.timestamp "DateTime", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "Reason", limit: 1024, null: false
    t.integer "Duration", limit: 1, default: 1, null: false, comment: "Value in days. 255 = permanent", unsigned: true
    t.boolean "Active", default: true, null: false, comment: "1 = true, 0 = false"
  end

  create_table "cashshop_storage", primary_key: "ProductId", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "AccountID", null: false, unsigned: true
    t.integer "HLSitemTblidx", null: false, unsigned: true
    t.integer "StackCount", limit: 1, null: false, unsigned: true
    t.integer "giftCharId", unsigned: true
    t.boolean "IsRead", default: false, null: false
    t.string "SenderName", limit: 16, collation: "gbk_chinese_ci"
    t.integer "year", null: false, unsigned: true
    t.integer "month", limit: 1, null: false, unsigned: true
    t.integer "day", limit: 1, null: false, unsigned: true
    t.integer "hour", limit: 1, null: false, unsigned: true
    t.integer "minute", limit: 1, null: false, unsigned: true
    t.integer "second", limit: 1, null: false, unsigned: true
    t.integer "millisecond", null: false, unsigned: true
    t.boolean "isMoved", default: false, null: false, comment: "BOOL. Did the player move the item to his inventory"
    t.integer "Buyer", default: 0, comment: "account id from the buyer", unsigned: true
    t.integer "price", default: 0, unsigned: true
    t.bigint "ItemID", default: 0, unsigned: true
    t.index ["AccountID", "isMoved"], name: "AccountID"
    t.index ["ProductId", "AccountID"], name: "ProductId", unique: true
  end

  create_table "event_reward", primary_key: "EventID", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "AccountID", comment: "账号id", unsigned: true
    t.integer "rewardTblidx", comment: "奖励句柄", unsigned: true
    t.integer "CharID", default: 0, comment: "角色id", unsigned: true
    t.string "CharName", limit: 15, collation: "gbk_chinese_ci"
    t.integer "IsDraw", limit: 1, default: 0, unsigned: true
    t.timestamp "DrawTime", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.index ["AccountID"], name: "AccountID"
    t.index ["EventID"], name: "EventID", unique: true
  end

  create_table "shortcuts", primary_key: ["AccountID", "ActionID"], charset: "latin1", force: :cascade do |t|
    t.integer "AccountID", null: false, unsigned: true
    t.integer "ActionID", default: 0, null: false, unsigned: true
    t.integer "wKey", default: 0, null: false, unsigned: true
    t.index ["AccountID", "ActionID"], name: "AccountID", unique: true
    t.index ["AccountID"], name: "AccountID_2"
  end

end
