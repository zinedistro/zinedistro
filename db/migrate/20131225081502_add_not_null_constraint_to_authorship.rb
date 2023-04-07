class AddNotNullConstraintToAuthorship < ActiveRecord::Migration[7.0]
  def change
    change_column :authorships, :author_id, :integer, null: false
    change_column :authorships, :zine_id, :integer, null: false
  end
end
