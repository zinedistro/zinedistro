class AddTagsTable < ActiveRecord::Migration
  def change
    create_table "tags", force: true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.integer  "zine_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
