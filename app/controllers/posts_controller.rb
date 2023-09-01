class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(comments: [:author]).where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'post successful'
      redirect_to user_posts_path(@user)
    else
      flash.now[:alert] = 'invalid post'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
