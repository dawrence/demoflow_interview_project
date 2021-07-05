# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_05_044040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "demos", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "demo_id", null: false
    t.integer "active_slide_id"
    t.json "presented_slides", default: "[]"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active_slide_id"], name: "index_presentations_on_active_slide_id"
    t.index ["demo_id"], name: "index_presentations_on_demo_id"
  end

  create_table "slides", force: :cascade do |t|
    t.string "type", null: false
    t.string "content"
    t.bigint "demo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demo_id"], name: "index_slides_on_demo_id"
  end

  add_foreign_key "presentations", "demos"
  add_foreign_key "slides", "demos"
end
