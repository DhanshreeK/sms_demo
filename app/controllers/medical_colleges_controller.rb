class MedicalCollegesController < ApplicationController
  before_action :set_medical_college, only: [:show, :edit, :update, :destroy]

  # GET /medical_colleges
  # GET /medical_colleges.json
  def index
    @medical_colleges = MedicalCollege.all
  end

  # GET /medical_colleges/1
  # GET /medical_colleges/1.json
  def show
  end

  # GET /medical_colleges/new
  def new
    @medical_college = MedicalCollege.new
  end

  # GET /medical_colleges/1/edit
  def edit
  end

  # POST /medical_colleges
  # POST /medical_colleges.json
  def create
    @medical_college = MedicalCollege.new(medical_college_params)

    respond_to do |format|
      if @medical_college.save
        format.html { redirect_to @medical_college, notice: 'Medical college was successfully created.' }
        format.json { render :show, status: :created, location: @medical_college }
      else
        format.html { render :new }
        format.json { render json: @medical_college.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_colleges/1
  # PATCH/PUT /medical_colleges/1.json
  def update
    respond_to do |format|
      if @medical_college.update(medical_college_params)
        format.html { redirect_to @medical_college, notice: 'Medical college was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_college }
      else
        format.html { render :edit }
        format.json { render json: @medical_college.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_colleges/1
  # DELETE /medical_colleges/1.json
  def destroy
    @medical_college.destroy
    respond_to do |format|
      format.html { redirect_to medical_colleges_url, notice: 'Medical college was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_college
      @medical_college = MedicalCollege.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_college_params
      params.require(:medical_college).permit(:college_name, :country_id)
    end
end
