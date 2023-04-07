class AddAuthorIdToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :author_id, :integer
  end
end
