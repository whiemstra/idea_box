class CategoriesController < ApplicationController
  # TODO - only admin's can create and delete categories!

  # TODO protect pages - before_filter :require_login

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      flash[:error] = 'Title must be filled in.'
      render :new
    end
  end

  # no need for EDIT, UPDATE b/c you can only create/destroy

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
