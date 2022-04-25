class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: email)
    if @user.present? && @user.authenticated?(password)
      user_session_attributes.each do |attr|
        session[attr] = @user.send(attr.to_s.delete_prefix('user_'))
      end
      @user.update(last_logged_in: DateTime.current)

      redirect_to user_path
    else
      redirect_to login_new_path
    end
  end

  def destroy
    user_session_attributes.each do |attr|
      session.delete(attr)
    end

    redirect_to login_new_path
  end

  private

  def all_params
    @all_params ||= params.require(:user).permit(:email, :password)
  end

  def email
    all_params[:email]
  end

  def password
    all_params[:password]
  end
end
