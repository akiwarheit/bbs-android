class RenameAdminToUser < ActiveRecord::Migration
  def self.up
    rename_table :admins, :users;
  end

  def self.down
    rename_table :users, :admins
  end
end
