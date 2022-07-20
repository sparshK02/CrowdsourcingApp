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

ActiveRecord::Schema[7.0].define(version: 2022_07_19_180725) do
  create_table "annotations", force: :cascade do |t|
    t.text "product"
    t.text "question"
    t.text "paraphrase"
    t.text "answer"
    t.text "highly_relevant"
    t.text "partially_relevant"
    t.boolean "assigned", default: false
    t.boolean "finished", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "annotatorID"
    t.text "reviews"
    t.text "productAttributes"
    t.text "QnAs"
    t.string "itemID"
    t.text "externalSources"
    t.boolean "answerable"
    t.text "productDesc"
    t.text "irrelevant"
    t.text "notSure"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "annotatorID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["annotatorID"], name: "index_users_on_annotatorID", unique: true
  end

  add_foreign_key "annotations", "users", column: "annotatorID", primary_key: "annotatorID"
end
