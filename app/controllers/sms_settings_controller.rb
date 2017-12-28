class SmsSettingsController < ApplicationController
  def new
     if current_user.role == 'Center'
      @sms_setting = current_user.center.sms_setting
       @general_setting = GeneralSetting.first
    elsif current_user.role == 'Employee'
       @sms_setting = current_user.employee.center.sms_setting
       @general_setting = GeneralSetting.first
    else
      @general_setting = GeneralSetting.first
	    @sms_setting = current_user.sms_setting
      @user = User.first
     end
	end

	def update
    @user = User.first
    @sms_setting = SmsSetting.load(params[:id])
    if @sms_setting.update(sms_setting_params)
      redirect_to new_sms_setting_path
    else
      render 'new'
    end
  end

  private

  # this private methods tell us exactly which parameters are allowed
  # into our controller actions.
  def sms_setting_params
    params.require(:sms_setting).permit!
  end
end