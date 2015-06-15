class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user

  def current_user
    @current_user ||= if session.has_key?(:user_id)
                        User.find(session[:user_id])
                      end
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    return true if logged_in?
    flash[:error] = 'You must be logged in to perform this action.'
    redirect_to login_path
  end

  def require_admin
    return true if current_admin
    flash[:error] = 'You do not have permissions to perform this action'
    redirect_to root_path
  end

  def current_admin   #? at the end b/c I want it to return true or false, while for current_user, we want to return an object
    logged_in? && current_user.admin?   #make sure there's a current_user AND check if they are an admin
  end

end
