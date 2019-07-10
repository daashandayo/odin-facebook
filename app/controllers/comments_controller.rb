class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(user_id: current_user.id, content: params[:content])
    if @comment.save
      redirect_to(request.env['HTTP_REFERER'])   
     else
      redirect_to(request.env['HTTP_REFERER'])    
    end
  end

end
