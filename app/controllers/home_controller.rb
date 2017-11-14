class HomeController < ApplicationController
  # this method id used for display index page
  def index
    redirect_to dashboard_home_index_path if current_user
  end

  def dashboard
  	@general_setting = GeneralSetting.first
  	@user = User.first
  end
end
