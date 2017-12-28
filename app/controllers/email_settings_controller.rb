class EmailSettingsController < ApplicationController
  def new
     if current_user.role == 'Center'
      @email_setting = current_user.center.email_setting
       @general_setting = GeneralSetting.first
    elsif current_user.role == 'Employee'
       @email_setting = current_user.employee.center.email_setting
       @general_setting = GeneralSetting.first
    else
      @general_setting = GeneralSetting.first
	    @email_setting = current_user.email_setting
      @user = User.first
     end
	end

	def update
    @user = User.first
    @email_setting = EmailSetting.load(params[:id])
    if @email_setting.update(email_setting_params)
      redirect_to new_email_setting_path
    else
      render 'new'
    end
  end

  private

  # this private methods tell us exactly which parameters are allowed
  # into our controller actions.
  def email_setting_params
    params.require(:email_setting).permit!
  end
end
