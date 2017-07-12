class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).limit(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'The post have been created'
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:description)
  end
  
end
#rails g peperclip post photo <-- cuando baje e instale lo de paperclip

