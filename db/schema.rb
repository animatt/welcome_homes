ActiveRecord::Schema[7.0].define(version: 2022_04_24_205447) do
  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.datetime "last_logged_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
