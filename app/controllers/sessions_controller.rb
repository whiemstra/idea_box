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
      flash[:error] = 'Username and/or Password are incorrect'  #'Username has already been taken.'
      render 'new'
    end
  end

  def destroy
    # session.clear
    # redirect_to login_path
  end
end
