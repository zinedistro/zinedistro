class AddPdfToZines < ActiveRecord::Migration
  def change
    add_column :zines, :pdf, :string
  end
end
