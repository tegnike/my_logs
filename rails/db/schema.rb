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

ActiveRecord::Schema[7.0].define(version: 2022_10_19_201405) do
  create_table "annual_incomes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.bigint "company_id", comment: "会社ID"
    t.string "name", comment: "名称"
    t.date "target_year", null: false, comment: "対象年"
    t.integer "amount", null: false, comment: "金額"
    t.integer "work_time", comment: "稼働時間"
    t.text "note", comment: "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_annual_incomes_on_company_id"
    t.index ["user_id"], name: "index_annual_incomes_on_user_id"
  end

  create_table "companies", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.string "name", null: false, comment: "名前"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "monthly_incomes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.bigint "company_id", comment: "会社ID"
    t.string "name", comment: "名称"
    t.date "target_month", null: false, comment: "対象月"
    t.integer "amount", null: false, comment: "金額"
    t.integer "work_time", comment: "稼働時間"
    t.text "note", comment: "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_monthly_incomes_on_company_id"
    t.index ["user_id"], name: "index_monthly_incomes_on_user_id"
  end

  create_table "salaries", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "company_id", null: false, comment: "会社ID"
    t.date "start_date", null: false, comment: "開始日"
    t.date "end_date", null: false, comment: "終了日"
    t.integer "amount", null: false, comment: "金額"
    t.integer "currency", null: false, comment: "通貨"
    t.integer "calc_type", null: false, comment: "計算タイプ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_salaries_on_company_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "name", null: false, comment: "名前"
    t.string "email", null: false, comment: "メールアドレス"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "annual_incomes", "companies"
  add_foreign_key "annual_incomes", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "monthly_incomes", "companies"
  add_foreign_key "monthly_incomes", "users"
  add_foreign_key "salaries", "companies"
end
