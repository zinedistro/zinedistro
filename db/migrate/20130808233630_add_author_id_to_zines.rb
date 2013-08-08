class AddAuthorIdToZines < ActiveRecord::Migration
  def change
    add_column :zines, :author_id, :integer
  end
end
