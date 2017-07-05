class RenameAdminUsersToUsers < ActiveRecord::Migration
  def change
    return unless table_exists?(:admin_users)
    rename_table(:admin_users, :users)
  end
end
