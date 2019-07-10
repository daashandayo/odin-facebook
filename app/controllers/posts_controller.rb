class PostsController < ApplicationController

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          flash[:success] = "Post created!"
          redirect_to users_show_path(@user, id: current_user.id)
        else
          redirect_to users_show_path(@user, id: current_user.id)
        end
    end

    def index
      friendsids = current_user.friendships.pluck(:friend_id) << current_user.id
      @postall = Post.where(user_id:friendsids) 
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end

end
