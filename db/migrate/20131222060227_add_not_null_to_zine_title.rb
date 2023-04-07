class AddNotNullToZineTitle < ActiveRecord::Migration[7.0]
  def change
    change_column(:zines, :title, :string, null: false)
  end
end
