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

ActiveRecord::Schema.define(version: 2022_03_16_084634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
