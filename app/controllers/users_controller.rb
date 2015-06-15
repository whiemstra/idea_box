class UsersController < ApplicationController

  def index
    render :index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to categories_path
    else
      flash[:error] = 'Username and Password cannot be blank'  #'Username has already been taken.'
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
