class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @videos = Video.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  end

  def show
    @category = Category.find(params[:id])
  end

  def delete
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end