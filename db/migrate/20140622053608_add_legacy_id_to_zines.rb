class AddLegacyIdToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :legacy_id, :integer
  end

end
