class AddForeignKeysToAnnouncement < ActiveRecord::Migration
  def self.up
    add_column :announcements, :user_id, :integer, {:null => false}
    add_column :announcements, :organization_id, :integer, {:null => false}
  end

  def self.down
     remove_column :announcements, :user_id
     remove_column :announcements, :organization_id
  end
end
