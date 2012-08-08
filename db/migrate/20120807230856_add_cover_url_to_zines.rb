class AddCoverUrlToZines < ActiveRecord::Migration
  def change
    add_column :zines, :cover_url, :string
  end
end
