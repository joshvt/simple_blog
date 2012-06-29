class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])    
    @post.update_attributes(params[:post])
    if @post.valid?
      render :show 
    else
      render "edit"
    end
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create(params[:post])
  	if @post.valid?
  		redirect_to posts_path
  	else
  		render "new"
  	end
  end
end
