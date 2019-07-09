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

    private

    def post_params
      params.require(:post).permit(:content)
    end

end
