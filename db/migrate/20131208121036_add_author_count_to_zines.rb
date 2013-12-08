class AddAuthorCountToZines < ActiveRecord::Migration
  def change
    add_column :zines, :author_count, :integer, null: false, default: 0
  end
end
