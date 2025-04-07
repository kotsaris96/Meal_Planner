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

ActiveRecord::Schema[8.0].define(version: 2025_03_27_095858) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "days", force: :cascade do |t|
    t.string "name", null: false
    t.date "date", null: false
    t.bigint "week_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "days_meals", id: false, force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "day_id", null: false
    t.index ["meal_id", "day_id"], name: "index_days_meals_on_meal_id_and_day_id", unique: true
  end

  create_table "devise_api_tokens", force: :cascade do |t|
    t.string "resource_owner_type", null: false
    t.bigint "resource_owner_id", null: false
    t.string "access_token", null: false
    t.string "refresh_token"
    t.integer "expires_in", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_devise_api_tokens_on_access_token"
    t.index ["previous_refresh_token"], name: "index_devise_api_tokens_on_previous_refresh_token"
    t.index ["refresh_token"], name: "index_devise_api_tokens_on_refresh_token"
    t.index ["resource_owner_type", "resource_owner_id"], name: "index_devise_api_tokens_on_resource_owner"
  end

  create_table "meals", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "meal_type"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_day_meals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "day_id", null: false
    t.bigint "meal_id", null: false
    t.boolean "is_selected", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_user_day_meals_on_day_id"
    t.index ["meal_id"], name: "index_user_day_meals_on_meal_id"
    t.index ["user_id"], name: "index_user_day_meals_on_user_id"
  end

  create_table "user_meal_likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "meal_id", null: false
    t.boolean "is_like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_user_meal_likes_on_meal_id"
    t.index ["user_id"], name: "index_user_meal_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "is_admin", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.string "weekday_start"
    t.string "weekday_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "days", "weeks"
  add_foreign_key "days_meals", "days"
  add_foreign_key "days_meals", "meals"
  add_foreign_key "user_day_meals", "days"
  add_foreign_key "user_day_meals", "meals"
  add_foreign_key "user_day_meals", "users"
  add_foreign_key "user_meal_likes", "meals"
  add_foreign_key "user_meal_likes", "users"
end
