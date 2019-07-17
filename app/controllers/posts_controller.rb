# frozen_string_literal: true

class PostsController < ApplicationController

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          flash[:success] = "Post created!"
          redirect_to users_show_path(@user, id: current_user.id) and return
        end
        redirect_to users_show_path(@user, id: current_user.id)
    end

    def index
      friendsids = current_user.friendships.pluck(:friend_id) << current_user.id
      @postall = Post.where(user_id:friendsids) 
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      flash[:success] = 'Post deleted'
      redirect_to users_show_path(@user, id: current_user.id)
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end

end
