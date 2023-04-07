class AddAddedAtToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :added_at, :datetime
  end
end
