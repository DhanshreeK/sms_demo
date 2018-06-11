class StudentDetailsController < ApplicationController
  respond_to :js, :json, :html
  before_action :set_student_detail, only: [:show, :edit, :update, :destroy]

  # GET /student_details
  # GET /student_details.json
  def index
    @student_details = StudentDetail.all
    @general_setting = GeneralSetting.first
  end

  # GET /student_details/1
  # GET /student_details/1.json
  def show   
  respond_to do |format|
        format.html
        format.pdf do
            render pdf: "show.pdf.erb"   # Excluding ".pdf" extension.
          end
        end
  end

  def stoptime
    # byebug
  end

  # GET /student_details/new
  def new
    @student_detail = StudentDetail.new
  end

  # GET /student_details/1/edit
  def edit
  end

  def save_test
    @student_detail = StudentDetail.find(params[:id])
    if params[:question].present?
      @test = params[:question]
       @test.each do |key, value|
        StudentAnswer.create(student_detail_id: @student_detail.id,
                                    question_id: key,
                                    answer_id: value)
        ans = Answer.where(question_id: key.to_i, id: value.to_i).take
      end
                  redirect_to student_answer_student_detail_path(@student_detail)

    else
            redirect_to student_answer_student_detail_path(@student_detail)
    end
  end

def student_answer
  @student_detail= StudentDetail.find(params[:id])
  #@cor is the array of course names selected by the student
  @cor = @student_detail.courses.all.map{|i| [i.course_name]}
   @med = @student_detail.medical_colleges.all.map{|i| [i.college_name]}
    @country = @student_detail.countries.all.map{|i| [i.country]}
  #@length is the length of the array named @cor
  @length = @cor.length
  dob = (Date.today.strftime('%Y%m%d').to_i - @student_detail.birthdate.strftime('%Y%m%d').to_i) / 10000
  @student_detail.update(age: dob)
        if params[:params1].present?
            @student_detail.update!(stoptime: params[:params1])
        end
end

  def disp_time
  
  
  end

  def search
    @student_details = StudentDetail.all
    if params[:search]
      @student_details = StudentDetail.search(params[:search]).order("created_at DESC")
    else
      @student_details = StudentDetail.all.order('created_at DESC')
    end
    
      end
    
      # POST /student_details
      # POST /student_details.json
      def create
       
        time = params[:time]
        @student_detail = StudentDetail.new(student_detail_params)
        
         respond_to do |format|
          if @student_detail.save
          
        format.html { redirect_to  question_question_path(@student_detail), notice: 'Student detail was successfully created.' }
        #format.json { render :show, status: :created, location: @student_detail }
        
      else
        format.html { render :new }
        format.json { render json: @student_detail.errors, status: :unprocessable_entity }
     
    end
    end
  end
       
  # PATCH/PUT /student_details/1
  # PATCH/PUT /student_details/1.json
  def update
    respond_to do |format|
      if @student_detail.update(student_detail_params)
        format.html { redirect_to student_details_path, notice: 'Student detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_detail }
      else
        format.html { render :edit }
        format.json { render json: @student_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_details/1
  # DELETE /student_details/1.json
  def destroy
    @student_detail.destroy
    respond_to do |format|
      format.html { redirect_to student_details_path, notice: 'Student detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_detail
      @general_setting = GeneralSetting.first
      @student_detail = StudentDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_detail_params
      params.require(:student_detail).permit(:status_update_id ,:alternate_no, :wp_no ,:category_list  ,:first_name, :middle_name, :last_name, :email, :address , :contact_no, :course_applied_for, :age, :birthdate, :father_name, :mother_name, :father_education, :father_occupation, :mother_education, :ssc_marks, :hsc_marks, :pcb, :pcm, :signature ,:neet , :college_id , :budget_id ,course_ids: [], country_ids: [], medical_college_ids: [])
    end
end
