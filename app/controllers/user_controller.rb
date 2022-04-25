class UserController < ApplicationController
  def index
    redirect_to login_new_path unless session[:user_first_name].present?
  end
end
