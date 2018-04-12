class QuestionsController < ApplicationController
	def index
  	@questions=Question.all
  end

  def new
  	@question=Question.new


  end
  def show
  	@question=Question.find(params[:id])
  end

  def create
  	@question=Question.new(question_params)
  	
  	if @question.save
      flash[:notice] = 'Successfully created question.'

      redirect_to @question
    else
      render :new
  end

  end
  def edit
  	  	@question=Question.find(params[:id])
end
def update
	@question=Question.find(params[:id])
	@question.update(question_params)
	redirect_to @question
end
def destroy
	@question=Question.find(params[:id])
	@question.destroy
	redirect_to questions_path
end
def question
	@questions = Question.all
  @student_detail = StudentDetail.find(params[:id])

	#@question = Question.find(params[:id])
end




  private
  def question_params
  	params.require(:question).permit(:question , :student_detail_id, answers_attributes: [:id , :answer  , :_destroy])
  end
end
