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

ActiveRecord::Schema[7.0].define(version: 2023_09_02_165155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "icon"
    t.string "name", null: false
    t.string "ticker_symbol_prefix", null: false
    t.string "code_cvm"
    t.string "description", null: false
    t.string "cnpj", null: false
    t.string "website"
    t.uuid "country_id", null: false
    t.uuid "sector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_companies_on_cnpj", unique: true
    t.index ["code_cvm"], name: "index_companies_on_code_cvm", unique: true
    t.index ["country_id"], name: "index_companies_on_country_id"
    t.index ["sector_id"], name: "index_companies_on_sector_id"
    t.index ["ticker_symbol_prefix"], name: "index_companies_on_ticker_symbol_prefix", unique: true
  end

  create_table "countries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "locale", null: false
    t.string "acronym", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "icon", null: false
    t.string "ticker_symbol", null: false
    t.integer "stock_type", null: false
    t.string "isin"
    t.uuid "company_id", null: false
    t.uuid "asset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_stocks_on_asset_id"
    t.index ["company_id"], name: "index_stocks_on_company_id"
    t.index ["isin"], name: "index_stocks_on_isin", unique: true
    t.index ["ticker_symbol"], name: "index_stocks_on_ticker_symbol", unique: true
  end

  create_table "system_configurations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "operation_type", null: false
    t.date "trading_date", null: false
    t.decimal "quantity", null: false
    t.decimal "unit_value", null: false
    t.uuid "user_id", null: false
    t.string "investible_type", null: false
    t.uuid "investible_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investible_type", "investible_id"], name: "index_transactions_on_investible"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "user_assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "investible_type", null: false
    t.uuid "investible_id", null: false
    t.decimal "amount", null: false
    t.decimal "balance", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investible_type", "investible_id"], name: "index_user_assets_on_investible"
    t.index ["user_id"], name: "index_user_assets_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "companies", "countries"
  add_foreign_key "companies", "sectors"
  add_foreign_key "stocks", "assets"
  add_foreign_key "stocks", "companies"
  add_foreign_key "transactions", "users"
  add_foreign_key "user_assets", "users"
end
