class ReportsController < ApplicationController
	def general_report
		@centers = Center.all
		@general_setting = GeneralSetting.first
	end

	def select_center
		@center = Center.load(params[:center_id])
		@center_students = @center.students
		@student_count = @center.students.count
	end

	def new
		@general_setting = GeneralSetting.first
	end

	def create
		@results = Student.all
		@general_setting = GeneralSetting.first
		@start_date = params[:report][:start_date].to_date
	    @end_date = params[:report][:end_date].to_date
	    if @start_date.nil? || @end_date.nil?
         flash[:alert] = 'Done'
         render 'new'
      end
	end

	def payment_status
		@pending_payments = PendingPayment.all
		respond_to do |format|
	      format.html
	      format.csv { send_data @pending_payments.to_csv }
	      format.xls { send_data @pending_payments.to_csv(col_sep: "\t"), filename: 'pending_payments-#{Date.today}.xls'}
	    end
	end

	def reference_report
		@general_setting = GeneralSetting.first
	end

	def select_employee
		@student = Student.load(params[:student_id])
		@students = @student.reference_student
	end

	def university_report
		@general_setting = GeneralSetting.first
	end

	def select_university
		@university = University.load(params[:university_id])
		@university_students = @university.students
		@student_count = @university.students.count
	end

	def course_report
		@general_setting = GeneralSetting.first
	end

	def select_course
		@course = Course.load(params[:course_id])
		@course_students = @course.students
		@student_count = @course.students.count
	end

end
