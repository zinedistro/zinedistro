class RenameCoverUrlToCoverImage < ActiveRecord::Migration
  def change
    rename_column :zines, :cover_url, :cover_image
  end
end
