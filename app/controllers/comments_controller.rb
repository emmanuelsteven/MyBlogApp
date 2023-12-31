class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @user
    if @comment.save
      flash[:success] = 'comment created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Error: comment not saved'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
