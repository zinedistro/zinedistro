class AddDownloadUrlToZines < ActiveRecord::Migration
  def change
    add_column :zines, :download_url, :string
  end
end
