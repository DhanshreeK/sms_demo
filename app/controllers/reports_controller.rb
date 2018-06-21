class ReportsController < ApplicationController
	def general_report
		@centers = Center.all
		@general_setting = GeneralSetting.first
		#@pnbs = Pnb.all
   # respond_to do |format|
    #  format.html
     # format.csv { send_data @pnbs.to_csv }
      #format.xls { send_data @pnbs.to_csv(col_sep: "\t"), filename: 'center_report.xls'}
    #end
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
		if current_user.role == "Center"
			@results = Student.where(center_id: current_user.center_id)
		end
		@general_setting = GeneralSetting.first
		@start_date = params[:report][:start_date].to_date
	    @end_date = params[:report][:end_date].to_date
	    if @start_date.nil? || @end_date.nil?
         flash[:alert] = 'Done'
         render 'new'
      end
	end

	def index
		@pending_payments = PendingPayment.all
		if current_user.role == "Center"

			@pending_payments = PendingPayment.where(center_id: current_user.center_id)
		end
	end


  	def export

  			@pending_payments = PendingPayment.all
  			book = Spreadsheet::Workbook.new
    		sheet1 = book.create_worksheet :name => 'Sheet1'
    		 sheet1.row(0).push "ENROLLMENT NO","DATE(DD/MM/YY)","STUDENT NAME" , "FEES" ,"PENDING FEES","OFFICE CENTER","STATUS OF FEES" 
    		

    		@pending_payments.each_with_index do |r,i|
     			@i = i += 1
     			sheet1.insert_row(sheet1.last_row_index + 1 ,["#{@i}" ,"#{r.student.enrollment}" , "#{r.student.created_at.to_date.strftime("%d/%m/%Y")}","#{r.student.first_name+" "+r.student.last_name}" ,"#{r.fees_pending}" ,"#{r.fees_paid}" , "#{r.student.center.center_name}" , "#{r.payment_status}"])
     		 	
     		 	
      		end
      		 spreadsheet = StringIO.new
     		 	book.write spreadsheet
      		file = "Excelsheet"
      			send_data spreadsheet.string, :filename => "#{file}", :type =>  "application/vnd.ms-excel"
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
		if current_user.role == "Center"
			@university_students = @university.students.where(center_id: current_user.center_id)
		end

		@student_count = @university.students.count
	end

	def course_report
		@general_setting = GeneralSetting.first
	end

	def select_course
		@course = Course.load(params[:course_id])
		@course_students = @course.students
		if current_user.role == "Center"
			@course_students = @course.students.where(center_id: current_user.center_id)
		end

		@student_count = @course.students.count
	end

end
