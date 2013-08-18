class RemoveAuthorIdFromZines < ActiveRecord::Migration
  def change
    remove_column :zines, :author_id
  end
end
