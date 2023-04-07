class AddNewPaperCountToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :new_paper_count, :integer
  end
end
