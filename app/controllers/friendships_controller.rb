# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    user1 = { 
      user_id: current_user.id, 
      friend_id: friendship_params[:friend_id],
      status: "Requested"
    }
    user2 = { 
      user_id: friendship_params[:friend_id], 
      friend_id: current_user.id, 
      status: "Pending"
    }
    Friendship.create(user1)
    Friendship.create(user2)
    redirect_to users_path
  end

  def index
    @notifications = Friendship.where("user_id = ? AND status = 'Pending' ",current_user.id)
  end

  def update
    user1 = {
      user_id: current_user.id,
      friend_id: friendship_params[:friend_id]
    }
    user2 = {
      user_id: friendship_params[:friend_id],
      friend_id: current_user.id
    }
    f1 = Friendship.find_by(user1)
    f2 = Friendship.find_by(user2)

    f1.update(status: "Accepted")
    f2.update(status: "Accepted")

    redirect_to users_path
  end

  private
  def friendship_params
    params.permit(:friend_id)
  end
end
