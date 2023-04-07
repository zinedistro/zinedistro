class AddCoverUrlToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :cover_url, :string
  end
end
