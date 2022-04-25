class ApplicationController < ActionController::Base
  before_action :user_logged_in?, :admin_logged_in?

  def user_logged_in?
    @user_logged_in = session[user_session_attributes.first].present?
  end

  def admin_logged_in?
    @admin_logged_in = session[admin_session_attributes.first].present?
  end

  def require_admin_login
    redirect_to admin_login_path unless admin_logged_in?
  end

  def user_session_attributes
    [
      :user_email,
      :user_first_name,
      :user_last_name
    ]
  end

  def admin_session_attributes
    [
      :admin_first_name,
      :admin_last_name,
      :admin_email
    ]
  end
end
