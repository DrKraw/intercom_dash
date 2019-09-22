class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit]

  def new
    @user = User.new
  end

  def show
    redirect_to dashboard_path if logged_in?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to your Intercom #{@user.username}"
      redirect_to dashboard_path
    else
      render 'new'
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated succesfully!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    # byebug
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to dashboard_path
    end
  end

end
