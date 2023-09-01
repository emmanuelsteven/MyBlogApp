class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(like_params)
    @like.save
    redirect_to user_post_path(@user.id, @post)
  end
end

  
