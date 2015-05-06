class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :link, :body, :post_type)
    if @post.save
      redirect_to posts_path, flash: { notice: 'Thank you for submitting your post.' }
    else
      @fields_with_problems = @post.errors.messages.keys
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end
end
