# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(user_params)
    @posts = @user.posts
    @post = Post.new
  end

  private
  def user_params
    params.permit(:id)
  end
end
