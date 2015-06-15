class IdeasController < ApplicationController
  # TODO restrict actions to the original user who created the idea

  # TODO protect pages:
  # before_filter :require_login

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
    # if @idea.user != current_user
    #   flash[:error] = 'You can only edit your own ideas'
    #   redirect_to root_path
    # else
    #   render
    # end
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update_attributes(idea_params)
      redirect_to category_path(@idea.category)
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    # if @idea.user != current_user
    #   flash[:error] = 'You can only destroy your own ideas'
    #   redirect_to root_path
    # else
      @idea.destroy
      redirect_to category_path(@idea.category)
    # end
  end

  private

  def idea_params
    params.require(:idea).permit(:description, :category_id)
  end

end
