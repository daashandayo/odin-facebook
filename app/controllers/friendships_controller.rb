class FriendshipsController < ApplicationController
  def create
    Friendship.create(user_id: current_user.id, friend_id: params[:friend_id], status: "Req")
    Friendship.create(user_id: params[:friend_id], friend_id: current_user.id, status: "Pen")
    redirect_to users_path
  end
end
