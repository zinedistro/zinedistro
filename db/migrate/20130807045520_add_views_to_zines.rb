class AddViewsToZines < ActiveRecord::Migration
  def change
    add_column :zines, :views, :integer
  end
end
