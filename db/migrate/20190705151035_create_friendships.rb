# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end

    add_index(:friendships, %i[user_id friend_id], unique: true)
    add_index(:friendships, %i[friend_id user_id], unique: true)
  end
end
