class AddNotNullToZineTitle < ActiveRecord::Migration
  def change
    change_column(:zines, :title, :string, null: false)
  end
end
