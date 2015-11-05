ActiveRecord::Schema.define(version: 20151103102630) do

  create_table "entries", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "hours"
    t.integer  "minutes"
    t.text     "comments"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entries", ["project_id"], name: "index_entries_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.integer  "priority"
  end

end