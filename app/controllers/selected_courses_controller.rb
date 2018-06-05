class SelectedCoursesController < ApplicationController
	def index
  		@selected_courses = subscription.all
end
def new
		@selected_course = SelectedCourse.new
	end
	def create
		@selected_course = SelectedCourse.new(selected_course_params)
		@selected_course.save
		redirect_to @selected_course
	end
	def show
		@selected_course = SelectedCourse.find(params[:id])
	end
	def edit
	   @selected_course = SelectedCourse.find(params[:id])
	end
	def update
	   @selected_course = SelectedCourse.find(params[:id])
	   @selected_course.update(selected_course_params_params)
	   @selected_course.save
	   redirect_to @selected_course
	end
	
	def destroy
		@selected_course = SelectedCourse.find(params[:id])
		@selected_course.destroy
		redirect_to subscriptions_path
	end
	private
	def selected_course_params
		params.require(:selected_course).permit!

	end

end
