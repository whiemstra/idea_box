class CategoriesController < ApplicationController
  # TODO - only admin's can create and delete categories!

  def index
    @categories = Category.all
  end

  def show
    # TODO show a particular category
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
    # TODO deletes a category from the database
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
