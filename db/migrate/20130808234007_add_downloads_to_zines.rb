class AddDownloadsToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :downloads, :integer, default: 0
  end
end
