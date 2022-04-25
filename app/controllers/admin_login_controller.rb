class AdminLoginController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.find_by(email: email)
    if @admin.present? && @admin.authenticated?(password)
      admin_session_attributes.each do |attr|
        session[attr] = @admin.send(attr.to_s.delete_prefix('admin_'))
      end

      redirect_to admin_path
    else
      redirect_to admin_login_new_path
    end
  end

  def destroy
    admin_session_attributes.each do |attr|
      session.delete(attr)
    end

    redirect_to admin_login_new_path
  end

  private

  def all_params
    @all_params ||= params.require(:admin).permit(:email, :password)
  end

  def email
    all_params[:email]
  end

  def password
    all_params[:password]
  end
end
