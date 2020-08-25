class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  def show
  end

  def new
    @post = Post.new 
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
    redirect_to post_path(@post)
    else  
    @errors = @post.errors.full_messages 
    render "new"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
      else  
      @errors = @post.errors.full_messages 
      render "edit"
      end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
