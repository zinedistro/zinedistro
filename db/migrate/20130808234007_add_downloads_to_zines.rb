class AddDownloadsToZines < ActiveRecord::Migration
  def change
    add_column :zines, :downloads, :integer, default: 0
  end
end
