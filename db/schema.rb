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

ActiveRecord::Schema[7.1].define(version: 2023_12_26_165621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_modifier_groups", force: :cascade do |t|
    t.string "item_id", null: false
    t.string "modifier_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_modifier_groups_on_item_id"
    t.index ["modifier_group_id"], name: "index_item_modifier_groups_on_modifier_group_id"
  end

  create_table "items", primary_key: "identifier", id: :string, force: :cascade do |t|
    t.string "type", null: false
    t.string "label"
    t.string "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_items_on_identifier", unique: true
  end

  create_table "menu_sections", force: :cascade do |t|
    t.string "menu_id", null: false
    t.string "section_id", null: false
    t.integer "display_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_sections_on_menu_id"
    t.index ["section_id"], name: "index_menu_sections_on_section_id"
  end

  create_table "menus", primary_key: "identifier", id: :string, force: :cascade do |t|
    t.string "label"
    t.string "state", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_menus_on_identifier", unique: true
  end

  create_table "modifier_groups", primary_key: "identifier", id: :string, force: :cascade do |t|
    t.string "label"
    t.integer "selection_required_min"
    t.integer "selection_required_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_modifier_groups_on_identifier", unique: true
  end

  create_table "modifiers", force: :cascade do |t|
    t.string "item_id", null: false
    t.string "modifier_group_id", null: false
    t.integer "display_order", default: 0
    t.integer "default_quantity", default: 0
    t.float "price_override"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_modifiers_on_item_id"
    t.index ["modifier_group_id"], name: "index_modifiers_on_modifier_group_id"
  end

  create_table "section_items", force: :cascade do |t|
    t.string "section_id", null: false
    t.string "item_id", null: false
    t.integer "display_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_section_items_on_item_id"
    t.index ["section_id"], name: "index_section_items_on_section_id"
  end

  create_table "sections", primary_key: "identifier", id: :string, force: :cascade do |t|
    t.string "label"
    t.string "description"
    t.integer "display_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_sections_on_identifier", unique: true
  end

  add_foreign_key "item_modifier_groups", "items", primary_key: "identifier"
  add_foreign_key "item_modifier_groups", "modifier_groups", primary_key: "identifier"
  add_foreign_key "menu_sections", "menus", primary_key: "identifier"
  add_foreign_key "menu_sections", "sections", primary_key: "identifier"
  add_foreign_key "modifiers", "items", primary_key: "identifier"
  add_foreign_key "modifiers", "modifier_groups", primary_key: "identifier"
  add_foreign_key "section_items", "items", primary_key: "identifier"
  add_foreign_key "section_items", "sections", primary_key: "identifier"
end
