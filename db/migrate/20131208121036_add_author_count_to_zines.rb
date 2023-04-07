class AddAuthorCountToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :author_count, :integer, null: false, default: 0
  end
end
