class HomeController < ApplicationController
  # this method id used for display index page
  def index
      @activities = PublicActivity::Activity.all
    redirect_to dashboard_home_index_path if current_user
  end

  def dashboard
    @employee = current_user.employee
    @acts ||= UserActivity.order(created_at: :asc) if current_user.id == 1
  end

  def user_activity
    @activity = UserActivity.shod(params[:id])
    @model ||= @activity.activity_model
  end

  def dash
        @acts ||= UserActivity.order(created_at: :asc) if current_user.id == 1
  end

end


