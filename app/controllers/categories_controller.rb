class CategoriesController < ApplicationController
  # TODO - only admin's can create and delete categories!

  def index
    @categories = Category.all
  end

  def show
    # TODO show a particular category
  end

  def new
    # TODO displays the form to the user
  end

  def create
    # TODO consumes the data from the form and persists it
  end

  # no need for EDIT, UPDATE b/c you can only create/destroy

  def destroy
    # TODO deletes a category from the database
  end
end
