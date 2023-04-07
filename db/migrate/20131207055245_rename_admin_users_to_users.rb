class RenameAdminUsersToUsers < ActiveRecord::Migration[7.0]
  def change
    return unless table_exists?(:admin_users)
    rename_table(:admin_users, :users)
  end
end
