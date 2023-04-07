class AddRecentlyPublishedIndexToZines < ActiveRecord::Migration[7.0][7.0]
  def change
    add_index :zines, [:published, :updated_at]
  end
end
