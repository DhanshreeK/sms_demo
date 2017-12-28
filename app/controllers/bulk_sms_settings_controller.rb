class BulkSmsSettingsController < ApplicationController
	
	def new
		@bulk_sms_setting = BulkSmsSetting.new
		@centers = Center.all
		@general_setting = GeneralSetting.first
	end

	def index
		@bulk_sms_settings = BulkSmsSetting.all
		@general_setting = GeneralSetting.first
	end

	def select
		@center = Center.load(params[:center_id])
		@center_students = @center.students
	end

	def create
		ids = []
		@general_setting = GeneralSetting.first
		center_id = Center.load(params[:bulk_sms_setting][:center_id])
		center_id.present? && params[:student_ids].present? && params[:student_ids].each do |student_id|
			if Student.find(student_id.to_i)
				ids << student_id
				@bulk_message = BulkSmsSetting.find_or_initialize_by(student_id:  student_id ,center_id: params[:bulk_sms_setting][:center_id])
				@bulk_message.body = params[:bulk_sms_setting][:body]
				@bulk_message.save
			end
		end
		flash[:notice] = 'message_to_student_sent'
		@students = Student.where(id: ids)
	end
end
