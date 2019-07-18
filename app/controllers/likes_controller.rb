# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    post = Post.find(like_params[:post_id])
    @like = post.likes.build(user_id: current_user.id)
    if @like.save
      redirect_to(request.env['HTTP_REFERER']) and return
    end
    redirect_to(request.env['HTTP_REFERER'])
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy
    flash[:success] = 'Like deleted'
    redirect_to(request.env['HTTP_REFERER'])    
  end

  private
  def like_params
    params.permit(:post_id)
  end
end
