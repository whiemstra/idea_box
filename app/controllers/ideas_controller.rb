class IdeasController < ApplicationController
  # TODO restrict actions to the original user who created the idea

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to category_path(@idea.category)
    else
      flash[:error] = "Category and Description must be present"
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update_attributes(idea_params)
      redirect_to category_path(@idea.category)
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to category_path(@idea.category)
  end

  private

  def idea_params
    params.require(:idea).permit(:description, :category_id)
  end
end
