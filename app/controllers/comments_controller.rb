class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(user_id: current_user.id, content: params[:content])
    if @comment.save
        redirect_to users_show_path(@user, id: post.user.id)
    else
        redirect_to users_show_path(@user, id: post.user.id)
    end
  end

end
