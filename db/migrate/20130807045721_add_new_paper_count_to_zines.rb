class AddNewPaperCountToZines < ActiveRecord::Migration
  def change
    add_column :zines, :new_paper_count, :integer
  end
end
