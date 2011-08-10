class AddUserIdToEvents < ActiveRecord::Migration
  def self.up
    add_column(:events, :user_id, :integer, {:null => false})
  end

  def self.down
    remove_column(:events, :user_id)
  end
end
