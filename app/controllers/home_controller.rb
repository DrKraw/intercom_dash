class HomeController < ApplicationController

  def index
    # if logged_in then redirect user to dashboard
    redirect_to dashboard_path if logged_in?
  end
  
end
