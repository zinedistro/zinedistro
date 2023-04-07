class MigrateSchemaFromOldSite < ActiveRecord::Migration[7.0]
  def change
    create_table "authors" do |t|
      t.string   "name"
      t.timestamps
    end

    create_table "authorships" do |t|
      t.integer  "author_id"
      t.integer  "zine_id"
    end

    create_table "zines" do |t|
      t.string   "title"
      t.string   "subtitle"
      t.timestamps
      t.boolean  "published",       :default => true
      t.text     "full_text"
      t.string   "url"
      t.text     "excerpt"
    end
  end
end
