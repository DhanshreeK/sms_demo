class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

	def index
  	@questions=Question.all
  end

  def new
  	@question=Question.new
    @general_setting = GeneralSetting.first
  end

  def show
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
  end

def update
	@question.update(question_params)
	redirect_to @question
end

def destroy
	@question.destroy
	redirect_to questions_path
end

def question
	@questions = Question.all
  @student_detail = StudentDetail.find(params[:id])
	#@question = Question.find(params[:id])
end

  private

  def set_question
    @general_setting = GeneralSetting.first
    @question = Question.find(params[:id])
  end

  def question_params
  	params.require(:question).permit(:question , :student_detail_id, answers_attributes: [:id , :answer  , :_destroy])
  end
end
