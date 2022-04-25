class AdminSuLoginController < ApplicationController
  before_action :require_admin_login

  def new
    @user = User.find_by(email: email)
    if @user.present?
      user_session_attributes.each do |attr|
        session[attr] = @user.send(attr.to_s.delete_prefix('user_'))
      end

      redirect_to user_path
    else
      redirect_to admin_path
    end
  end

  private

  def email
    params.require(:email)
  end
end
