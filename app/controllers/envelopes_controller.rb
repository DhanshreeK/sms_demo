class EnvelopesController < ApplicationController
	def index
		@envelopes = Envelope.all
		@general_setting = GeneralSetting.first
	end

	def new
		@envelope = Envelope.new
		@general_setting = GeneralSetting.first
	end

	def select
		@center = Center.load(params[:envelope_center_id])
		@center_students = @center.students
	end

	def create_envelopes
		@envelopes = Envelope.all
		@general_setting = GeneralSetting.first
		center = Center.load(params[:envelope][:center_id])
		center.present? && params[:student_ids].present? && @students = center.students.where(id: params[:student_ids]).each do |student|
		    @envelope = Envelope.find_or_initialize_by(student_id: student.id, center_id: params[:envelope][:center_id])
			@envelope.content = params[:envelope][:content]
			@envelope.date = params[:envelope][:date]
			@envelope.save
			flash[:notice] = 'Envelope created successfully'
		end
	end

	def show
		@envelope = Envelope.load(params[:id])
		respond_to do |format|
		    format.html
		    format.pdf do
		        render pdf: "show.pdf.erb"   # Excluding ".pdf" extension.
		      end
		    end
	end


	private

	def envelop_params
		params.require(:envelope).permit(:date,:content,:center_id,:student_id)
	end
end
