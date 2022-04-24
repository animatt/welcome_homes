class LoginController < ApplicationController
  def create
    user = User.find_by(email: email)
    if user.present? && user.authenticated?(password)
      session[:user_first_name] = @user.first_name
      session[:user_last_name]  = @user.last_name
      session[:user_email]      = @user.email

      redirect_to user_path
    else
      redirect_to login_path, action: :create
    end
  end

  private

  def email
    params.require(:email)
  end

  def password
    params.require(:password)
  end
end
