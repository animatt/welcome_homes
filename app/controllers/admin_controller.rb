class AdminController < ApplicationController
  def index
    if admin_logged_in?
      @users = User.all
    else
      redirect_to admin_login_new_path
    end
  end
end
