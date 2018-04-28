class CommentsController < ApplicationController
	 def create
    @student_detail = StudentDetail.find(params[:student_detail_id])
    @comment = @student_detail.comments.create(comment_params)
    redirect_to student_answer_student_detail_path(@student_detail)
    @general_setting = GeneralSetting.first
  end
 
  private
    def comment_params
      params.require(:comment).permit!
    end
end
