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

ActiveRecord::Schema.define(version: 2022_05_27_082026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news", force: :cascade do |t|
    t.boolean "status", null: false
    t.datetime "news_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "title", limit: 50
    t.text "article"
    t.string "category", limit: 50
    t.string "tag", limit: 50
  end

  create_table "quest_monsters", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "quest_stage_id"
    t.string "img_path"
    t.integer "hp", null: false
    t.integer "mp", null: false
    t.integer "power", null: false
    t.integer "protect", null: false
    t.integer "speed", null: false
    t.integer "wise", null: false
    t.integer "luck", null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_quest_monsters_on_name", unique: true
    t.index ["quest_stage_id"], name: "index_quest_monsters_on_quest_stage_id"
  end

  create_table "quest_quizzes", force: :cascade do |t|
    t.bigint "quest_stage_id", null: false
    t.bigint "quest_monster_id", null: false
    t.string "format", null: false
    t.string "question", null: false
    t.string "choice", null: false
    t.string "answer", null: false
    t.string "tips"
    t.string "episode"
    t.integer "exp", null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "open_status", default: false, null: false, comment: "true -> 公開｜false -> 非公開"
    t.index ["quest_monster_id"], name: "index_quest_quizzes_on_quest_monster_id"
    t.index ["quest_stage_id"], name: "index_quest_quizzes_on_quest_stage_id"
  end

  create_table "quest_stages", force: :cascade do |t|
    t.integer "num", null: false
    t.string "name", null: false
    t.text "episode", null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["num", "name"], name: "index_quest_stages_on_num_and_name", unique: true
  end

  create_table "quest_statuses", force: :cascade do |t|
    t.integer "lv"
    t.integer "exp"
    t.integer "hp"
    t.integer "mp"
    t.integer "power"
    t.integer "protect"
    t.integer "speed"
    t.integer "wise"
    t.integer "luck"
    t.index ["lv", "exp"], name: "index_quest_statuses_on_lv_and_exp", unique: true
  end

  create_table "quest_users", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "name", limit: 255, null: false
    t.integer "lv", default: 1, null: false
    t.integer "exp", default: 0, null: false
    t.string "sex", default: "？", null: false
    t.string "job"
    t.integer "quiz_id", default: 1, null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "change_token_digest"
    t.integer "recent_quiz_id"
    t.index ["change_token_digest"], name: "index_quest_users_on_change_token_digest", unique: true
    t.index ["users_id"], name: "index_quest_users_on_users_id", unique: true
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "quiz", null: false
    t.boolean "answer", null: false
    t.integer "answer2"
    t.index ["quiz"], name: "index_quizzes_on_quiz", unique: true
  end

  create_table "testtables", force: :cascade do |t|
    t.integer "test_num"
    t.string "test_str"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_urls", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "web_url1", limit: 255
    t.string "web_url2", limit: 255
    t.string "web_url3", limit: 255
    t.string "twitter_url", limit: 255
    t.string "facebook_url", limit: 255
    t.string "instagram_url", limit: 255
    t.string "youtube_url", limit: 255
    t.string "tiktok_url", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_user_urls_on_users_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, null: false, comment: "ユーザー名"
    t.string "email", limit: 255, null: false, comment: "メールアドレス"
    t.string "password_digest", null: false, comment: "暗号化・bcrypt「gem bcrypt」使用)"
    t.string "activation_digest", comment: "暗号化・bcrypt「gem bcrypt」使用)"
    t.boolean "activated", default: false, null: false, comment: "アカウントアクティベート"
    t.datetime "activated_at"
    t.string "reset_digest", comment: "パスワードリマインダー"
    t.datetime "reset_sent_at"
    t.boolean "acount_lock", default: false, null: false, comment: "アカウントロック"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "acount_plan", default: 1, null: false, comment: "0 -> 管理者｜1 -> 無料プラン｜2 -> 有料プラン"
    t.string "corporation_name", comment: "法人名"
    t.integer "corporation", comment: "法人区分：1 -> 個人｜2 -> 個人事業主｜3 -> 法人"
    t.boolean "check_latest_news", default: false, null: false, comment: "true -> チェック済み｜false -> 未チェック"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "quest_users", "users", column: "users_id"
  add_foreign_key "user_urls", "users", column: "users_id"
end
