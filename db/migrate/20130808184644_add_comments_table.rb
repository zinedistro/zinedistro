class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table "comments", force: true do |t|
      t.integer  "user_id"
      t.integer  "zine_id"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
