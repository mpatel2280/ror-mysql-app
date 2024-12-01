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

ActiveRecord::Schema[7.1].define(version: 2024_12_01_055300) do
  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_gainers", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "stock_name", null: false
    t.string "stock_symbol", null: false
    t.string "exchange", null: false
    t.string "sector_name", null: false
    t.string "industry_name", null: false
    t.float "market_cap"
    t.string "market_category"
    t.float "ltp"
    t.float "change"
    t.float "change_in_percent"
    t.timestamp "stock_date"
    t.index ["change_in_percent"], name: "idx_change_in_percent"
    t.index ["exchange"], name: "exchange"
    t.index ["ltp"], name: "ltp"
    t.index ["sector_name"], name: "sector_name"
    t.index ["stock_date"], name: "stock_date"
    t.index ["stock_name"], name: "idx_stock_name"
    t.index ["stock_symbol"], name: "idx_stock_symbol"
  end

  create_table "profiles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "bio"
    t.integer "age"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "profiles", "users"
end
