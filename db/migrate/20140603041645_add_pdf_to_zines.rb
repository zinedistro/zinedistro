class AddPdfToZines < ActiveRecord::Migration[7.0]
  def change
    add_column :zines, :pdf, :string
  end
end
