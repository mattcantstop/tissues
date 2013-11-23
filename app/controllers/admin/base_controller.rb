class Admin::BaseController < ApplicationController
  before_action :authorize_admin!

  def index

  end

  def authorize_admin!
    require_signin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

end
