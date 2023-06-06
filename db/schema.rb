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

ActiveRecord::Schema[7.0].define(version: 2023_06_05_092907) do
  create_table "holdings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "stock_id", null: false
    t.integer "quantity"
    t.integer "purchase_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_holdings_on_stock_id"
    t.index ["user_id"], name: "index_holdings_on_user_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industry_stocks", force: :cascade do |t|
    t.integer "industry_id", null: false
    t.integer "stock_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_industry_stocks_on_industry_id"
    t.index ["stock_id"], name: "index_industry_stocks_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "company_name"
    t.string "symbol"
    t.string "exchange"
    t.string "sector"
    t.integer "market_capitalization"
    t.string "description"
    t.integer "Quarterly_Earnings_Growth_YOY"
    t.integer "Quarterly_Revenue_Growth_YOY"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.integer "User_id", null: false
    t.integer "Stock_id", null: false
    t.string "trade_type"
    t.integer "trade_price"
    t.integer "quantity"
    t.datetime "trade_timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Stock_id"], name: "index_trades_on_Stock_id"
    t.index ["User_id"], name: "index_trades_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "trading_style"
    t.string "experience_level"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.string "card_type"
    t.string "firstname"
    t.string "lastname"
    t.string "cc"
    t.string "valid_date"
    t.string "cvc"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchlist_stocks", force: :cascade do |t|
    t.integer "watchlist_id", null: false
    t.integer "stock_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_watchlist_stocks_on_stock_id"
    t.index ["watchlist_id"], name: "index_watchlist_stocks_on_watchlist_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "name"
    t.string "stock_name"
    t.string "stock_symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "holdings", "Stocks", column: "stock_id"
  add_foreign_key "holdings", "Users", column: "user_id"
  add_foreign_key "industry_stocks", "industries"
  add_foreign_key "industry_stocks", "stocks"
  add_foreign_key "trades", "Stocks"
  add_foreign_key "trades", "Users"
  add_foreign_key "watchlist_stocks", "stocks"
  add_foreign_key "watchlist_stocks", "watchlists"
  add_foreign_key "watchlists", "users"
end
