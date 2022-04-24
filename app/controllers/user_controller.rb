class UserController < ApplicationController
  def index
    unless session
      redirect_to login_path
    end
  end

  def create
    @user = User.create!(**create_params)
    session[:user_first_name] = @user.first_name
    session[:user_last_name]  = @user.last_name
    session[:user_email]      = @user.email

    redirect_to user_path
  end
end
