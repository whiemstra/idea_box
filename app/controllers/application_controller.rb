class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    return true if logged_in?
    flash[:error] = 'You must be logged in to perform this action.'
    redirect_to login_path
  end

end
