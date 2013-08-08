class AddFavesTable < ActiveRecord::Migration
  def change
    create_table "faves", force: true do |t|
      t.integer  "user_id"
      t.integer  "zine_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
