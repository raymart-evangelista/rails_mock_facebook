class RenameFriendIdToFriendB < ActiveRecord::Migration[7.0]
  def change
    rename_column :friendships, :friend_id, :friend_b
  end
end
