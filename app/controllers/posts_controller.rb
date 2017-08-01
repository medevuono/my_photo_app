class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] #el usuario puede usar new, create si esta autenticado

  def index
    @posts = Post.order(created_at: :desc).limit(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    #@post = Post.new(post_params)
    #@post.user_id = 1
    if @post.save
      redirect_to posts_path, notice: 'The post have been created'
    else
      render :new
    end
  end

  def show
    begin
      @post = Post.find(params[:id])
    rescue => e
      redirect_to posts_path, flash: { alert: "The post has not been found"}
    end
  end

#  def destroy
#    @post = Post.find(params[:id])
#  end

  private
  def post_params
    params.require(:post).permit(:description, :photo)
  end
  
end
