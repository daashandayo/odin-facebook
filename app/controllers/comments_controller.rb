# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = { user_id: current_user.id }.merge(comment_params)
    @comment = post.comments.build(comment)
    if @comment.save
      redirect_to(request.env['HTTP_REFERER']) and return
    end
    redirect_to(request.env['HTTP_REFERER'])
  end

  private
  def comment_params
    params.permit(:content)
  end
end
