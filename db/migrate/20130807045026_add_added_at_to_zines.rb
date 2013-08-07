class AddAddedAtToZines < ActiveRecord::Migration
  def change
    add_column :zines, :added_at, :datetime
  end
end
