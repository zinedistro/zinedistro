class RenameCoverUrlToCoverImage < ActiveRecord::Migration[7.0]
  def change
    rename_column :zines, :cover_url, :cover_image
  end
end
