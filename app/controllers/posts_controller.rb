class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).limit(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1
    if @post.save
      redirect_to posts_path, notice: 'The post have been created'
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:description, :photo)
  end
  
end