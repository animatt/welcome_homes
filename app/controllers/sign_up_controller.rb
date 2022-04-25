class SignUpController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    if passwords_dont_match?
      flash.alert = 'passwords don\'t match'
      render :new
    else
      @user = User.create!(**create_params)
      session[:user_first_name] = @user.first_name
      session[:user_last_name]  = @user.last_name
      session[:user_email]      = @user.email

      redirect_to user_path
    end
  end

  private

  def all_params
    @all_params ||= params
      .require(:user)
      .permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def create_params
    all_params.slice(:first_name, :last_name, :email, :password)
  end

  def passwords_dont_match?
    password, password_confirmation = all_params
      .values_at(:password, :password_confirmation)

    password != password_confirmation
  end
end
