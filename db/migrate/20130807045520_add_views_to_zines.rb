class AddViewsToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :views, :integer
  end
end
