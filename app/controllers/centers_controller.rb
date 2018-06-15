class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]

  # GET /centers
  # GET /centers.json
  def index
      @centers = Center.all

      @users = User.all

      @general_setting = GeneralSetting.first
      @user = User.first
       if params[:param1].present? && params[:param1] == 'false'
        center = Center.load(params[:id])
        center.update!(center_status: 'Active')
      elsif params[:param1].present? && params[:param1] == 'true'
         center = Center.load(params[:id])
        center.update!(center_status: 'Inactive')  
    end
  end

  # GET /centers/1
  # GET /centers/1.json
  def show
  end
  
  def empl
    @center = Center.find(params[:id])
  end
  # GET /centers/new
  def new
    @center = Center.new
    @center.center_code = Center.set_center_code
    @user = User.first
    @general_setting = GeneralSetting.first
  end

  # GET /centers/1/edit
  def edit
  end
  def center_vise_empl
    @centers = Center.all
  end

  def update_center
    @center = current_user.center
    @general_setting = GeneralSetting.first
    @user = User.first
  end

  # POST /centers
  # POST /centers.json
  def create
    respond_to do |format|
    @center = Center.new(center_params)
      if @center.save
        @center.update(sms_setting_id: current_user.sms_setting.id, email_setting_id: current_user.email_setting.id)
        format.html { redirect_to centers_path, notice: 'Center was successfully created.' }
        format.json { render :show, status: :created, location: @center }
      else
        format.html { render :new }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centers/1
  # PATCH/PUT /centers/1.json
  def update
    respond_to do |format|
      if @center.update(center_params)
        format.html { redirect_to @center, notice: 'Center was successfully updated.' }
        format.json { render :show, status: :ok, location: @center }
      else
        format.html { render :edit }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centers/1
  # DELETE /centers/1.json
  def destroy
    @center.destroy
    respond_to do |format|
      format.html { redirect_to centers_url, notice: 'Center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = Center.find(params[:id])
      @general_setting = GeneralSetting.first
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:center).permit(:photo,:email,:center_name,:status,:center_status, :countries, :address,:country, :city, :state, :pan_card_no, :contact, :alternate_contact, :center_starting_date, :contact_person_name, :residential_address, :center_code)
    end
end
