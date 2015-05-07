class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:comment_threads).page(params[:page])
  end

  def show
    @comment = Comment.build_from(@post, current_user.id, '') if user_signed_in?
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), flash: { notice: 'Thank you for updating your post.' }
    else
      flash.now[:error] = @post.errors.full_messages
      render :edit
    end
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, flash: { notice: 'Thank you for submitting your post.' }
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, flash: { notice: 'Your post has been removed.' }
    else
      redirect_to post_path(@post), flash: { error: 'We were unable to remove that post.' }
    end
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(
      :title,
      :link,
      :body,
      :post_type,
      :category_id)
  end
end
