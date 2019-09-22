class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # make views available to views
  helper_method :current_user, :logged_in?

  def current_user
    # return current_user or find one in the databas if they don;t exist
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
