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
  create_table "auctionhouse", primary_key: ["id", "CharID"], charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.bigint "id", null: false, unsigned: true
    t.integer "CharID", default: 0, null: false, unsigned: true
    t.integer "TabType", limit: 1, default: 255, null: false, unsigned: true
    t.string "ItemName", limit: 33, collation: "gbk_chinese_ci"
    t.string "Seller", limit: 17, collation: "gbk_chinese_ci"
    t.integer "Price", null: false, unsigned: true
    t.bigint "ItemID", null: false, unsigned: true
    t.integer "TimeStart", null: false, unsigned: true
    t.integer "TimeEnd", comment: "time in seconds", unsigned: true
    t.integer "ItemLevel", limit: 1, default: 0, null: false, unsigned: true
    t.integer "NeedClass", null: false, unsigned: true
    t.integer "ItemType", limit: 1, default: 0, null: false, unsigned: true
    t.index ["CharID"], name: "CharID"
    t.index ["id"], name: "id", unique: true
  end

  create_table "bannword", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "bannword", limit: 50, collation: "gbk_chinese_ci"
  end

  create_table "bind", primary_key: "CharID", id: { type: :integer, unsigned: true, default: nil }, charset: "latin1", force: :cascade do |t|
    t.integer "WorldID", default: 1, null: false, unsigned: true
    t.integer "BindObjectTblIdx", default: 4294967295, null: false, unsigned: true
    t.float "LocX", null: false
    t.float "LocY", null: false
    t.float "LocZ", null: false
    t.float "DirX", null: false
    t.float "DirY", null: false
    t.float "DirZ", null: false
    t.boolean "Type", default: true, null: false
    t.index ["CharID"], name: "CharID", unique: true
  end

  create_table "buffs", primary_key: ["CharID", "BuffIndex"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "SourceTblidx", null: false, unsigned: true
    t.integer "SourceType", limit: 1, default: 255, null: false, comment: "0 skill and 1 item", unsigned: true
    t.integer "BuffIndex", limit: 1, default: 255, null: false, unsigned: true
    t.integer "BuffGroup", limit: 1, default: 255, null: false, unsigned: true
    t.integer "InitialDuration", default: 0, null: false, unsigned: true
    t.integer "TimeRemaining", default: 0, null: false, unsigned: true
    t.float "effectValue1", limit: 53
    t.float "effectValue2", limit: 53
    t.integer "Argument1_0", comment: "commonConfigTblidx", unsigned: true
    t.integer "Argument1_1", comment: "dwRemainTime", unsigned: true
    t.integer "Argument1_2", comment: "dwRemainValue", unsigned: true
    t.integer "Argument2_0", comment: "commonConfigTblidx", unsigned: true
    t.integer "Argument2_1", comment: "dwRemainTime", unsigned: true
    t.integer "Argument2_2", comment: "dwRemainValue", unsigned: true
    t.index ["CharID", "BuffIndex"], name: "CharID", unique: true
    t.index ["CharID"], name: "CharID_2"
  end

  create_table "characters", primary_key: ["CharID", "CharName", "SrvFarmID"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.string "CharName", limit: 16, null: false, collation: "gbk_chinese_ci"
    t.integer "AccountID", null: false, unsigned: true
    t.integer "Level", limit: 1, default: 1, null: false, unsigned: true
    t.integer "Exp", default: 0, null: false, unsigned: true
    t.integer "Race", limit: 1, unsigned: true
    t.integer "Class", limit: 1, unsigned: true
    t.integer "Gender", limit: 1, unsigned: true
    t.integer "Face", limit: 1, unsigned: true
    t.integer "Adult", limit: 1, default: 0, null: false, unsigned: true
    t.integer "Hair", limit: 1, null: false, unsigned: true
    t.integer "HairColor", limit: 1, default: 0, null: false, unsigned: true
    t.integer "SkinColor", limit: 1, default: 0, null: false, unsigned: true
    t.integer "Blood", limit: 1, default: 0, null: false, unsigned: true
    t.float "CurLocX", default: 78.900002, null: false
    t.float "CurLocY", default: 46.950001, null: false
    t.float "CurLocZ", default: 168.350006, null: false
    t.float "CurDirX", default: 0.95, null: false
    t.float "CurDirY", default: 0.0, null: false
    t.float "CurDirZ", default: 0.3, null: false
    t.integer "WorldID", default: 1, null: false, unsigned: true
    t.integer "WorldTable", default: 1, null: false, unsigned: true
    t.integer "MapInfoIndex", default: 0, null: false, unsigned: true
    t.bigint "Money", default: 0, null: false, unsigned: true
    t.bigint "MoneyBank", default: 0, null: false, unsigned: true
    t.boolean "TutorialFlag", default: false, null: false, comment: "0 = start tutorial / 1 = dont start tutorial"
    t.integer "TutorialHint", default: 0, null: false, unsigned: true
    t.boolean "NameChange", default: false, null: false
    t.integer "Reputation", default: 0, null: false, unsigned: true
    t.integer "MudosaPoint", default: 0, null: false, unsigned: true
    t.integer "SpPoint", default: 0, null: false, comment: "skill points", unsigned: true
    t.boolean "GameMaster", default: false, null: false
    t.integer "GuildID", default: 0, null: false, unsigned: true
    t.string "GuildName", limit: 16, collation: "gbk_chinese_ci"
    t.integer "CurLP", default: 15000, null: false
    t.integer "CurEP", limit: 2, default: 15000, null: false, unsigned: true
    t.integer "CurRP", limit: 2, default: 0, null: false, unsigned: true
    t.integer "CurAP", default: 450000, null: false
    t.boolean "MailIsAway", default: false, null: false
    t.integer "SrvFarmID", default: 0, null: false, unsigned: true
    t.bigint "DelCharTime", comment: "time(0) + 43200 = 12 hours", unsigned: true
    t.boolean "Hoipoi_NormalStart", default: false, null: false
    t.boolean "Hoipoi_SpecialStart", default: false, null: false
    t.integer "Hoipoi_Type", limit: 1, default: 255, null: false, unsigned: true
    t.integer "Hoipoi_MixLevel", limit: 1, default: 1, null: false, unsigned: true
    t.integer "Hoipoi_MixExp", default: 0, null: false, unsigned: true
    t.integer "Title", default: 4294967295, null: false, unsigned: true
    t.integer "Mascot", default: 4294967295, null: false, unsigned: true
    t.integer "RpBall", limit: 1, default: 0, null: false, unsigned: true
    t.integer "Netpy", default: 0, null: false, comment: "Netpy are points the user receives while staying online", unsigned: true
    t.integer "WaguPoint", default: 0, null: false, unsigned: true
    t.string "IP", limit: 16, default: "0.0.0.0", null: false, collation: "gbk_chinese_ci", comment: "the last IP in the char"
    t.integer "AirState", limit: 1, default: 0, null: false, comment: "0 = off and 1 = on", unsigned: true
    t.boolean "InvisibleCostume", default: false, null: false, comment: "0 = false 1 = true"
    t.bigint "PlayTime", default: 0, null: false, comment: "play time in seconds", unsigned: true
    t.integer "SuperiorEffectType", limit: 1, default: 0, null: false, unsigned: true
    t.bigint "CreateTime", null: false, comment: "time(0)", unsigned: true
    t.integer "is_online", default: 0, comment: "是否在线1是0否"
    t.index ["CharID", "AccountID"], name: "CharID_3", unique: true
    t.index ["CharID", "SrvFarmID"], name: "CharID_2", unique: true
    t.index ["CharID"], name: "CharID", unique: true
    t.index ["CharName"], name: "CharName", unique: true
  end

  create_table "dojos", primary_key: "DojoTblidx", id: { type: :integer, unsigned: true, default: nil }, charset: "latin1", force: :cascade do |t|
    t.integer "GuildId", null: false, unsigned: true
    t.integer "Level", limit: 1, default: 1, null: false, unsigned: true
    t.integer "PeaceStatus", limit: 1, default: 0, null: false, unsigned: true
    t.integer "PeacePoints", default: 0, null: false, unsigned: true
    t.string "GuildName", limit: 16, null: false, collation: "gbk_chinese_ci"
    t.string "LeaderName", limit: 16, collation: "gbk_chinese_ci"
    t.string "Notice", limit: 64, collation: "gbk_chinese_ci"
    t.integer "ChallengeGuildId", default: 4294967295, null: false, unsigned: true
    t.string "SeedCharName", limit: 16, collation: "gbk_chinese_ci"
    t.index ["DojoTblidx"], name: "DojoTblidx", unique: true
    t.index ["GuildId"], name: "GuildId", unique: true
  end

  create_table "friendlist", primary_key: ["user_id", "friend_id"], charset: "latin1", force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.integer "friend_id", null: false, unsigned: true
    t.string "friend_name", limit: 16, null: false, collation: "gbk_chinese_ci"
    t.boolean "blacklist", default: false, null: false
    t.index ["user_id", "friend_id"], name: "user_id", unique: true
    t.index ["user_id"], name: "user_id_2"
  end

  create_table "guild_members", primary_key: ["GuildID", "CharID"], charset: "latin1", force: :cascade do |t|
    t.integer "GuildID", null: false, unsigned: true
    t.integer "CharID", null: false, unsigned: true
    t.index ["CharID"], name: "CharID", unique: true
    t.index ["GuildID", "CharID"], name: "GuildID", unique: true
  end

  create_table "guilds", primary_key: ["GuildID", "GuildName"], charset: "latin1", force: :cascade do |t|
    t.integer "GuildID", null: false, unsigned: true
    t.string "GuildName", limit: 16, null: false, collation: "gbk_chinese_ci"
    t.integer "GuildMaster", null: false, unsigned: true
    t.integer "GuildSecondMaster", default: 4294967295, null: false, unsigned: true
    t.integer "GuildSecondMaster2", default: 4294967295, null: false, unsigned: true
    t.integer "GuildSecondMaster3", default: 4294967295, null: false, unsigned: true
    t.integer "GuildSecondMaster4", default: 4294967295, null: false, unsigned: true
    t.integer "GuildReputation", default: 0, null: false, unsigned: true
    t.integer "GuildPointEver", default: 0, null: false, comment: "max guild points ever received", unsigned: true
    t.bigint "FunctionFlag", default: 7, null: false, unsigned: true
    t.integer "GuildDisbandTime", unsigned: true
    t.integer "MarkInColor", limit: 1, default: 255, null: false, unsigned: true
    t.integer "MarkInLine", limit: 1, default: 255, null: false, unsigned: true
    t.integer "MarkMain", limit: 1, default: 255, null: false, unsigned: true
    t.integer "MarkMainColor", limit: 1, default: 255, null: false, unsigned: true
    t.integer "MarkOutColor", limit: 1, default: 255, null: false, unsigned: true
    t.integer "MarkOutLine", limit: 1, default: 255, null: false, unsigned: true
    t.string "NoticeBy", limit: 16, collation: "gbk_chinese_ci"
    t.string "GuildNotice", limit: 257, collation: "gbk_chinese_ci"
    t.integer "DojoColor", limit: 1, default: 255, null: false, unsigned: true
    t.integer "GuildColor", limit: 1, default: 255, null: false, unsigned: true
    t.integer "DogiType", limit: 1, default: 255, null: false, unsigned: true
    t.integer "Zeni", default: 0, comment: "Zeni inside guild bank", unsigned: true
    t.index ["GuildID"], name: "GuildID", unique: true
    t.index ["GuildName"], name: "GuildName", unique: true
  end

  create_table "hoipoi_recipe", primary_key: ["CharID", "RecipeTblidx"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "RecipeTblidx", null: false, unsigned: true
    t.integer "RecipeType", limit: 1, default: 255, null: false, unsigned: true
    t.index ["CharID", "RecipeTblidx"], name: "CharID_2", unique: true
    t.index ["CharID"], name: "CharID"
  end

  create_table "htb_skills", primary_key: ["skill_id", "owner_id"], charset: "latin1", force: :cascade do |t|
    t.integer "skill_id", default: 0, null: false, unsigned: true
    t.integer "owner_id", null: false, unsigned: true
    t.integer "SlotID", limit: 2, default: 0, null: false, unsigned: true
    t.integer "TimeRemaining", default: 0, null: false, unsigned: true
    t.index ["owner_id", "SlotID"], name: "owner_id", unique: true
    t.index ["skill_id", "owner_id"], name: "skill_id", unique: true
  end

  create_table "items", primary_key: ["id", "owner_id", "place", "pos"], charset: "latin1", force: :cascade do |t|
    t.bigint "id", null: false, unsigned: true
    t.integer "tblidx", default: 0, null: false, unsigned: true
    t.integer "owner_id", default: 0, null: false, comment: "character id", unsigned: true
    t.integer "place", limit: 1, default: 1, null: false, unsigned: true
    t.integer "pos", limit: 1, default: 0, null: false, unsigned: true
    t.integer "count", limit: 1, default: 1, null: false, unsigned: true
    t.integer "rank", limit: 1, default: 1, null: false
    t.integer "durability", limit: 1, default: 255, null: false, unsigned: true
    t.integer "grade", limit: 1, default: 0, null: false
    t.boolean "NeedToIdentify", default: false, null: false
    t.integer "BattleAttribute", limit: 1, default: 0, null: false, unsigned: true
    t.string "Maker", limit: 16, default: "", null: false, collation: "gbk_chinese_ci"
    t.integer "OptionTblidx", default: 4294967295, null: false, comment: "item_option_data tblidx", unsigned: true
    t.integer "OptionTblidx2", default: 4294967295, null: false, comment: "item_option_data tblidx", unsigned: true
    t.integer "OptionRandomId", limit: 2, default: 65535, null: false, comment: "item_enchant tblidx", unsigned: true
    t.integer "OptionRandomVal", default: 4294967295, null: false, unsigned: true
    t.integer "OptionRandomId2", limit: 2, default: 65535, null: false, unsigned: true
    t.integer "OptionRandomVal2", default: 4294967295, null: false, unsigned: true
    t.integer "OptionRandomId3", limit: 2, default: 65535, null: false, unsigned: true
    t.integer "OptionRandomVal3", default: 4294967295, null: false, unsigned: true
    t.integer "OptionRandomId4", limit: 2, default: 65535, null: false, unsigned: true
    t.integer "OptionRandomVal4", default: 4294967295, null: false, unsigned: true
    t.integer "OptionRandomId5", limit: 2, default: 65535, null: false, unsigned: true
    t.integer "OptionRandomVal5", default: 4294967295, null: false, unsigned: true
    t.integer "OptionRandomId6", limit: 2, default: 65535, null: false, unsigned: true
    t.integer "OptionRandomVal6", default: 4294967295, null: false, unsigned: true
    t.integer "OptionRandomId7", limit: 2, default: 65535, null: false, unsigned: true
    t.integer "OptionRandomVal7", default: 4294967295, null: false, unsigned: true
    t.integer "OptionRandomId8", limit: 2, default: 65535, null: false, unsigned: true
    t.integer "OptionRandomVal8", default: 4294967295, null: false, unsigned: true
    t.bigint "UseStartTime", default: 0, null: false, comment: "max duration time (3600 = 60 minutes)", unsigned: true
    t.bigint "UseEndTime", default: 0, null: false, comment: "current duration time (3600 = 60 minutes)", unsigned: true
    t.integer "RestrictState", limit: 1, default: 0, null: false, unsigned: true
    t.integer "DurationType", limit: 1, default: 0, null: false, unsigned: true
    t.integer "AccountID", default: 0, unsigned: true
    t.integer "GuildID", default: 0, unsigned: true
    t.index ["AccountID"], name: "AccountID"
    t.index ["GuildID"], name: "GuildID"
    t.index ["id"], name: "id", unique: true
    t.index ["owner_id", "place", "pos"], name: "owner_id"
    t.index ["owner_id", "place"], name: "owner_id_2"
    t.index ["owner_id"], name: "owner_id_idx"
    t.index ["tblidx"], name: "item_vnum_index"
  end

  create_table "items_cd", primary_key: ["GroupIndex", "CharID"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "GroupIndex", limit: 1, default: 0, null: false, unsigned: true
    t.integer "CoolTime", default: 0, null: false, unsigned: true
    t.integer "TimeRemaining", default: 0, null: false, unsigned: true
    t.index ["CharID", "GroupIndex"], name: "CharID", unique: true
  end

  create_table "mail", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
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

  create_table "mascots", primary_key: ["CharID", "SlotID"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "SlotID", limit: 1, default: 255, null: false, comment: "index", unsigned: true
    t.integer "MascotTblidx", null: false, unsigned: true
    t.integer "CurVP", default: 100, null: false, unsigned: true
    t.integer "MaxVP", default: 100, null: false, unsigned: true
    t.integer "CurExp", default: 0, null: false, unsigned: true
    t.integer "skillTblidx0", default: 4294967295, null: false, unsigned: true
    t.integer "skillTblidx1", default: 4294967295, null: false, unsigned: true
    t.integer "skillTblidx2", default: 4294967295, null: false, unsigned: true
    t.integer "skillTblidx3", default: 4294967295, null: false, unsigned: true
    t.index ["CharID", "SlotID"], name: "CharID", unique: true
    t.index ["CharID"], name: "CharID_2"
  end

  create_table "portals", primary_key: ["CharID", "Point"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "Point", limit: 1, null: false, unsigned: true
    t.index ["CharID", "Point"], name: "CharID_2", unique: true
    t.index ["CharID"], name: "CharID"
  end

  create_table "questitems", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "tblidx", null: false, unsigned: true
    t.integer "amount", limit: 1, default: 1, null: false, unsigned: true
    t.integer "pos", limit: 1, default: 255, null: false, unsigned: true
    t.index ["CharID"], name: "CharID_2"
  end

  create_table "quests", primary_key: ["CharID", "QuestID"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "QuestID", null: false, unsigned: true
    t.integer "tcQuestInfo", limit: 1, default: 1, null: false, unsigned: true
    t.integer "taQuestInfo", limit: 1, default: 0, null: false, unsigned: true
    t.integer "tgExcCGroup", limit: 1, default: 0, null: false, unsigned: true
    t.integer "tcPreId", limit: 1, default: 0, null: false, unsigned: true
    t.integer "tcCurId", limit: 1, default: 255, null: false, unsigned: true
    t.integer "tcId", limit: 1, default: 255, null: false, unsigned: true
    t.integer "taId", limit: 1, default: 255, null: false, unsigned: true
    t.integer "evtUserData", default: 0, null: false, unsigned: true
    t.integer "evtUserData2", default: 0, null: false, unsigned: true
    t.integer "evtUserData3", default: 0, null: false, unsigned: true
    t.integer "evtUserData4", default: 0, null: false, unsigned: true
    t.integer "tcTimeInfo", limit: 1, default: 255, null: false, unsigned: true
    t.integer "taTimeInfo", limit: 1, default: 255, null: false, unsigned: true
    t.integer "TimeLeft", default: 0, null: false, unsigned: true
    t.integer "QState", limit: 2, default: 0, null: false, unsigned: true
    t.index ["CharID", "QuestID"], name: "CharID_2", unique: true
    t.index ["CharID"], name: "CharID"
  end

  create_table "quick_teleport", primary_key: ["CharID", "SlotNum"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "SlotNum", limit: 1, default: 0, null: false, unsigned: true
    t.integer "WorldTblidx", null: false, unsigned: true
    t.float "LocX", null: false
    t.float "LocY", null: false
    t.float "LocZ", null: false
    t.integer "MapNameTblidx", null: false, unsigned: true
    t.integer "day", limit: 1, null: false, unsigned: true
    t.integer "hour", limit: 1, null: false, unsigned: true
    t.integer "minute", limit: 1, null: false, unsigned: true
    t.integer "month", limit: 1, null: false, unsigned: true
    t.integer "second", limit: 1, null: false, unsigned: true
    t.integer "year", null: false, unsigned: true
    t.index ["CharID", "SlotNum"], name: "CharID", unique: true
    t.index ["CharID"], name: "CharID_2"
  end

  create_table "quickslot", primary_key: ["CharID", "Slot"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", default: 0, null: false, unsigned: true
    t.integer "Tblidx", default: 0, null: false, unsigned: true
    t.integer "Slot", default: 0, null: false, unsigned: true
    t.integer "Type", limit: 1, default: 0, null: false, unsigned: true
    t.bigint "Item", default: 0, null: false, comment: "item unique id", unsigned: true
    t.index ["CharID", "Slot"], name: "CharID", unique: true
    t.index ["CharID"], name: "CharID_2"
  end

  create_table "rank_battle", primary_key: "CharID", id: { type: :integer, unsigned: true, default: nil }, charset: "latin1", force: :cascade do |t|
    t.integer "Win", default: 0, null: false, unsigned: true
    t.integer "Draw", default: 0, null: false, unsigned: true
    t.integer "Lose", default: 0, null: false, unsigned: true
    t.integer "StraightKOWin", default: 0, null: false, unsigned: true
    t.integer "MaxStraightKOWin", default: 0, null: false, unsigned: true
    t.integer "MaxStraightWin", default: 0, null: false, unsigned: true
    t.integer "StraightWin", default: 0, null: false, unsigned: true
    t.float "Points", default: 0.0, null: false
    t.index ["CharID"], name: "CharID", unique: true
  end

  create_table "skills", primary_key: ["owner_id", "SlotID"], charset: "latin1", force: :cascade do |t|
    t.integer "skill_id", default: 0, null: false, unsigned: true
    t.integer "owner_id", null: false, unsigned: true
    t.boolean "RpBonusAuto", default: false, null: false
    t.integer "RpBonusType", limit: 1, default: 255, null: false, unsigned: true
    t.integer "SlotID", limit: 1, default: 0, null: false, comment: "skillIndex", unsigned: true
    t.integer "TimeRemaining", default: 0, null: false, comment: "Skill CD Time", unsigned: true
    t.integer "Exp", default: 0, null: false, unsigned: true
    t.index ["owner_id", "SlotID"], name: "owner_id", unique: true
    t.index ["owner_id"], name: "owner_id_2"
  end

  create_table "titles", primary_key: ["CharID", "TitleTblidx"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "TitleTblidx", null: false, unsigned: true
    t.index ["CharID", "TitleTblidx"], name: "CharID_2", unique: true
    t.index ["CharID"], name: "CharID"
  end

  create_table "warfog", primary_key: ["CharID", "WarFog"], charset: "latin1", force: :cascade do |t|
    t.integer "CharID", null: false, unsigned: true
    t.integer "WarFog", null: false, unsigned: true
    t.index ["CharID", "WarFog"], name: "CharID_2", unique: true
    t.index ["CharID"], name: "CharID"
  end

end
