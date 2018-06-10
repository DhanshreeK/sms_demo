class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]

  # GET /universities
  # GET /universities.json
  def index
    if current_user.role == 'Center'
      @universities = current_user.center.universities
      @general_setting = GeneralSetting.first
    else
      @universities = University.all
      @general_setting = GeneralSetting.first
      @user = User.first
  end
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    @unversity_attachments = @university.unversity_attachments.all
  end

  # GET /universities/new
  def new
    @university = University.new
    @unversity_attachments = @university.unversity_attachments.build
    @general_setting = GeneralSetting.first
  end

  # GET /universities/1/edit
  def edit
  end

  # POST /universities
  # POST /universities.json
  def create
    @university = University.new(university_params)
    if current_user.role == 'Center'
      @university.update!(center_id: current_user.center.id)
    end
    respond_to do |format|
      if @university.save
        unversity_attachment = params[:unversity_attachments]['attachment']
        unversity_attachment.each do |a|
          @university_attachment = @university.unversity_attachments.create!(:attachment => a) 
       end
        format.html { redirect_to universities_path, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
      @general_setting = GeneralSetting.first
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:fees, :no_of_seats, :university_name,:status, :description, :country, unversity_attachments_attributes: [:id, :attachment, :attachment_name])
    end
end
