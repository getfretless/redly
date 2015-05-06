class CategoriesController < ApplicationController
  before_action :find_category, only: [:show]

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to posts_path, flash: { notice: 'Thanks for creating a category.' }
    else
      flash.now[:error] = @category.errors.full_messages
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :title, :description, :sidebar, :submission_text)
  end

  def find_category
    @category = Category.find params[:id]
  end
end
