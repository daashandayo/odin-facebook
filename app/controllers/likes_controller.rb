class LikesController < ApplicationController

    def create
        @like = Post.find(like_params).likes.build(user_id: current_user.id)
        if @like.save
            redirect_to users_show_path(@user, id: current_user.id)
        else
            redirect_to users_show_path(@user, id: current_user.id)
        end
    end


    private 
     def like_params
        params[:post_id]
     end
end



