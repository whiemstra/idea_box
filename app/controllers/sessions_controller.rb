class SessionsController < ApplicationController

  def new
    # TODO show signup form
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to categories_path
    else
      render 'new'
    end
  end
end
