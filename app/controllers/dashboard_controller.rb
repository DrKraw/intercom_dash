class DashboardController < ApplicationController

  def index
    # redirect_to login if user is not logged in 
    redirect_to login_path if !logged_in?
  end

end
