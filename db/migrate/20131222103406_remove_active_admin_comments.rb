class RemoveActiveAdminComments < ActiveRecord::Migration[7.0]
  def change
    return unless table_exists?(:active_admin_comments)
    drop_table(:active_admin_comments)
  end
end
