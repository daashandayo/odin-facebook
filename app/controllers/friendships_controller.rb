class FriendshipsController < ApplicationController
  def create
    # Refactor params to be safe------------------------------------------------------------------
    Friendship.create(user_id: current_user.id, friend_id: params[:friend_id], status: "Requested")
    Friendship.create(user_id: params[:friend_id], friend_id: current_user.id, status: "Pending")
    redirect_to users_path
  end

  def index
    @notifications = Friendship.where("user_id = ? AND status = 'Pending' ",current_user.id)
  end

  def update
    # Refactor params to be safe------------------------------------------------------
    f1 = Friendship.find_by(user_id: current_user.id, friend_id: params[:friend_id])
    f2 = Friendship.find_by(user_id: params[:friend_id], friend_id: current_user.id)

    f1.update(status: "Accepted")
    f2.update(status: "Accepted")

    redirect_to users_path
  end
end
