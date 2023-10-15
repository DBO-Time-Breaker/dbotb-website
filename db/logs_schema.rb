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
  create_table "auctionhouse_log", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "Seller", unsigned: true
    t.integer "Buyer", unsigned: true
    t.integer "Price", unsigned: true
    t.integer "ItemTblidx", unsigned: true
    t.bigint "ItemID", unsigned: true
    t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "auth_login_log", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "AccountID", null: false, unsigned: true
    t.string "IP", null: false, collation: "gbk_chinese_ci"
    t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["AccountID"], name: "AccountID"
  end

  create_table "budokai", primary_key: "server_index", id: { type: :integer, limit: 1, default: nil }, charset: "latin1", force: :cascade do |t|
    t.integer "SeasonCount", default: 0, null: false, comment: "Amount of budokais. 0 = 1, 10 = 11 ...", unsigned: true
    t.integer "DefaultOpenTime", default: 0, unsigned: true
    t.binary "RankPointInitialized", limit: 1, default: -> { "b'0'" }
    t.integer "StateData_State", limit: 1, default: 0, comment: "Budokai State", unsigned: true
    t.integer "StateData_NextStepTime", default: 0, comment: "budokai next step time", unsigned: true
    t.integer "IndividualStateData_State", limit: 1, default: 0, comment: "Solo match state", unsigned: true
    t.integer "IndividualStateData_NextStepTime", default: 0, comment: "solo match next step time", unsigned: true
    t.integer "TeamStateData_State", limit: 1, default: 0, comment: "team match state", unsigned: true
    t.integer "TeamStateData_NextStepTime", default: 0, comment: "Team match next state time", unsigned: true
  end

  create_table "budokai_winners", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "BudokaiNumber", default: 0, unsigned: true
    t.boolean "Type", default: false, comment: "0 = junior, 1 = adult"
    t.boolean "MatchType", default: false, comment: "0 = individual, 1 = team"
    t.integer "WinnerCharID1", default: 0, unsigned: true
    t.integer "WinnerCharID2", default: 0, unsigned: true
    t.integer "WinnerCharID3", default: 0, unsigned: true
    t.integer "WinnerCharID4", default: 0, unsigned: true
    t.integer "WinnerCharID5", default: 0, unsigned: true
    t.timestamp "Date", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
  end

  create_table "change_char_name", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.string "Name", limit: 17, collation: "gbk_chinese_ci"
    t.string "newName", limit: 17, collation: "gbk_chinese_ci"
    t.timestamp "date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "character_delete_log", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "AccountID", null: false, unsigned: true
    t.integer "CharID", null: false
  end

  create_table "dynamic_field_count", primary_key: "serverIndex", id: { type: :integer, limit: 1, default: 0, unsigned: true }, charset: "latin1", comment: "When the server restarts it will save & load the progress from this table.\r\nSince it takes many days to reach max count it is very important.", force: :cascade do |t|
    t.integer "count", default: 0, null: false, unsigned: true
    t.index ["serverIndex"], name: "serverIndex", unique: true
  end

  create_table "founder_log", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.string "Username", limit: 20, null: false, collation: "gbk_chinese_ci"
    t.string "forumname", null: false, collation: "gbk_chinese_ci"
    t.datetime "date", precision: nil, null: false
  end

  create_table "game_info", primary_key: "server_index", id: { type: :integer, limit: 1, default: nil }, charset: "gbk", force: :cascade do |t|
    t.integer "player_count", default: 0, null: false
  end

  create_table "gm_log", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "LogType", unsigned: true
    t.text "String", collation: "gbk_chinese_ci"
    t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
  end

  create_table "guild_name_change_log", primary_key: "key", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "GuildID", unsigned: true
    t.string "CurrentName", limit: 25, collation: "gbk_chinese_ci"
    t.string "NewName", limit: 25, collation: "gbk_chinese_ci"
    t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
  end

  create_table "item_upgrade_log", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "charId", null: false, unsigned: true
    t.binary "IsSuccess", limit: 1, null: false
    t.bigint "itemId", null: false, unsigned: true
    t.integer "itemTblidx", null: false, unsigned: true
    t.integer "grade", null: false
    t.integer "newGrade", null: false
    t.bigint "StoneItemId", null: false, unsigned: true
    t.integer "StoneItemTblidx", null: false, unsigned: true
    t.binary "CoreItemUse", limit: 1, null: false
    t.bigint "coreItemId", default: 0, null: false, unsigned: true
    t.integer "coreItemTblidx", null: false, unsigned: true
    t.timestamp "date", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
  end

  create_table "mail_deleted", id: { type: :integer, unsigned: true, default: nil }, charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "SenderType", limit: 1, default: 0, null: false, unsigned: true
    t.integer "MailType", limit: 1, default: 1, null: false, unsigned: true
    t.integer "TextSize", limit: 1, default: 0, null: false, unsigned: true
    t.string "Text", limit: 127, collation: "gbk_chinese_ci"
    t.integer "Zenny", default: 0, null: false, unsigned: true
    t.bigint "itemId", default: 0, null: false, unsigned: true
    t.string "TargetName", limit: 16, collation: "gbk_chinese_ci"
    t.string "FromName", limit: 16, collation: "gbk_chinese_ci"
    t.boolean "IsAccept", default: false, null: false
    t.boolean "IsLock", default: false, null: false
    t.boolean "IsRead", default: false, null: false
    t.bigint "CreateTime", unsigned: true
    t.bigint "EndTime", unsigned: true
    t.integer "RemainDay", limit: 1, default: 1, null: false, unsigned: true
    t.integer "year", null: false, unsigned: true
    t.integer "month", limit: 1, null: false, unsigned: true
    t.integer "day", limit: 1, null: false, unsigned: true
    t.integer "hour", limit: 1, null: false, unsigned: true
    t.integer "minute", limit: 1, null: false, unsigned: true
    t.integer "second", limit: 1, null: false, unsigned: true
    t.index ["CharID"], name: "CharID"
    t.index ["id", "CharID"], name: "id", unique: true
    t.index ["id"], name: "id_2", unique: true
  end

  create_table "mute_log", primary_key: "CharID", id: { type: :integer, unsigned: true, default: nil }, charset: "latin1", force: :cascade do |t|
    t.integer "GmAccountID", unsigned: true
    t.integer "DurationInMinutes", unsigned: true
    t.string "Reason", collation: "gbk_chinese_ci"
    t.bigint "muteUntil", unsigned: true
    t.timestamp "date", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["CharID"], name: "CharID", unique: true
  end

  create_table "privateshoplogs", primary_key: "key", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "SellerCharID", unsigned: true
    t.integer "BuyerCharID", unsigned: true
    t.integer "Zeni", unsigned: true
    t.integer "ItemCount", unsigned: true
    t.bigint "ItemID_1", unsigned: true
    t.integer "ItemTblidx_1", unsigned: true
    t.bigint "ItemID_2", unsigned: true
    t.integer "ItemTblidx_2", unsigned: true
    t.bigint "ItemID_3", unsigned: true
    t.integer "ItemTblidx_3", unsigned: true
    t.bigint "ItemID_4", unsigned: true
    t.integer "ItemTblidx_4", unsigned: true
    t.bigint "ItemID_5", unsigned: true
    t.integer "ItemTblidx_5", unsigned: true
    t.bigint "ItemID_6", unsigned: true
    t.integer "ItemTblidx_6", unsigned: true
    t.bigint "ItemID_7", unsigned: true
    t.integer "ItemTblidx_7", unsigned: true
    t.bigint "ItemID_8", unsigned: true
    t.integer "ItemTblidx_8", unsigned: true
    t.bigint "ItemID_9", unsigned: true
    t.integer "ItemTblidx_9", unsigned: true
    t.bigint "ItemID_10", unsigned: true
    t.integer "ItemTblidx_10", unsigned: true
    t.bigint "ItemID_11", unsigned: true
    t.integer "ItemTblidx_11", unsigned: true
    t.bigint "ItemID_12", unsigned: true
    t.integer "ItemTblidx_12", unsigned: true
    t.integer "HasIssues"
    t.string "IssueReason", limit: 512, collation: "gbk_chinese_ci"
    t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
  end

  create_table "slot_machine_log", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "accountid", unsigned: true
    t.integer "charid", unsigned: true
    t.integer "extractCount", unsigned: true
    t.integer "type", unsigned: true
    t.integer "coin"
    t.integer "currentPoints", unsigned: true
    t.integer "newPoints", unsigned: true
    t.integer "ProductId1", unsigned: true
    t.integer "ProductId2", unsigned: true
    t.integer "ProductId3", unsigned: true
    t.integer "ProductId4", unsigned: true
    t.integer "ProductId5", unsigned: true
    t.integer "ProductId6", unsigned: true
    t.integer "ProductId7", unsigned: true
    t.integer "ProductId8", unsigned: true
    t.integer "ProductId9", unsigned: true
    t.integer "ProductId10", unsigned: true
  end

  create_table "tradelogs", primary_key: "key", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "CharID", unsigned: true
    t.integer "TargetCharID"
    t.integer "Zeni", unsigned: true
    t.integer "ItemCount", unsigned: true
    t.bigint "ItemID_1", unsigned: true
    t.integer "ItemTblidx_1", unsigned: true
    t.bigint "ItemID_2", unsigned: true
    t.integer "ItemTblidx_2", unsigned: true
    t.bigint "ItemID_3", unsigned: true
    t.integer "ItemTblidx_3", unsigned: true
    t.bigint "ItemID_4", unsigned: true
    t.integer "ItemTblidx_4", unsigned: true
    t.bigint "ItemID_5", unsigned: true
    t.integer "ItemTblidx_5", unsigned: true
    t.bigint "ItemID_6", unsigned: true
    t.integer "ItemTblidx_6", unsigned: true
    t.bigint "ItemID_7", unsigned: true
    t.integer "ItemTblidx_7", unsigned: true
    t.bigint "ItemID_8", unsigned: true
    t.integer "ItemTblidx_8", unsigned: true
    t.bigint "ItemID_9", unsigned: true
    t.integer "ItemTblidx_9", unsigned: true
    t.bigint "ItemID_10", unsigned: true
    t.integer "ItemTblidx_10", unsigned: true
    t.bigint "ItemID_11", unsigned: true
    t.integer "ItemTblidx_11", unsigned: true
    t.bigint "ItemID_12", unsigned: true
    t.integer "ItemTblidx_12", unsigned: true
    t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
  end

end
