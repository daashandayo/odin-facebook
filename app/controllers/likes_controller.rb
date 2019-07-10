class LikesController < ApplicationController

    def create
        post = Post.find(like_params)
        @like = post.likes.build(user_id: current_user.id)
        if @like.save
            redirect_to users_show_path(@user, id: post.user.id)
        else
            redirect_to users_show_path(@user, id: post.user.id)
        end
    end


    private 
     def like_params
        params[:post_id]
     end
end



