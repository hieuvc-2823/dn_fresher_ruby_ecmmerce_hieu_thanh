class Admin::BaseController < ApplicationController
  layout "admin/layouts/application"
  before_action :logged_admin?

  def logged_admin?
    return if admin_logged_in?

    redirect_to login_path
    flash[:danger] = t "admin.permission"
  end
end
