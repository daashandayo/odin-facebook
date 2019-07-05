class AddIndexToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
  end
end
