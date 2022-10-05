class RenameUserIdToFriendA < ActiveRecord::Migration[7.0]
  def change
    rename_column :friendships, :user_id, :friend_a
  end
end
