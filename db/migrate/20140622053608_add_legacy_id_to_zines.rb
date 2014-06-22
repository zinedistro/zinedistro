class AddLegacyIdToZines < ActiveRecord::Migration
  def change
    add_column :zines, :legacy_id, :integer
  end

end
