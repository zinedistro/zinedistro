class AddDownloadUrlToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :download_url, :string
  end
end
