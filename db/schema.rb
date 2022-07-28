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

ActiveRecord::Schema.define(version: 2022_07_28_011759) do

  create_table "belongs", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id", "user_id"], name: "index_belongs_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_belongs_on_group_id"
    t.index ["user_id"], name: "index_belongs_on_user_id"
  end

  create_table "brankdays", force: :cascade do |t|
    t.integer "day_id"
    t.integer "time_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id", "time_id", "user_id"], name: "index_brankdays_on_day_id_and_time_id_and_user_id", unique: true
    t.index ["day_id"], name: "index_brankdays_on_day_id"
    t.index ["time_id"], name: "index_brankdays_on_time_id"
    t.index ["user_id"], name: "index_brankdays_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
