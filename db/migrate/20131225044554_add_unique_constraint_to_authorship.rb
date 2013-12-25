class AddUniqueConstraintToAuthorship < ActiveRecord::Migration
  def change
    change_table :authorships do |t|
      t.remove :id
      add_index :authorships, [:author_id, :zine_id], unique: true
    end
  end
end
