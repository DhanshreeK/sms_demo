class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  before_action :set_current_user
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def after_sign_in_path_for(resource)
      dashboard_home_index_path
  end

  def set_current_user
    User.current = current_user
  end

end
