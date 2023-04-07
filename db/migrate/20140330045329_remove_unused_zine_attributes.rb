class RemoveUnusedZineAttributes < ActiveRecord::Migration[7.0]
  def change
    remove_column :zines, :downloads, :integer
    remove_column :zines, :new_paper_count, :integer
    remove_column :zines, :views, :integer
    remove_column :zines, :url, :string
  end
end
