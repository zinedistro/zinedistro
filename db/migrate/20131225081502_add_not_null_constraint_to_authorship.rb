class AddNotNullConstraintToAuthorship < ActiveRecord::Migration
  def change
    change_column :authorships, :author_id, :integer, null: false
    change_column :authorships, :zine_id, :integer, null: false
  end
end
