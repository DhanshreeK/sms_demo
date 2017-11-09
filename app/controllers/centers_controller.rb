class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]

  # GET /centers
  # GET /centers.json
  def index
    @centers = Center.all
    @general_setting = GeneralSetting.last
    @user = User.first
  end

  # GET /centers/1
  # GET /centers/1.json
  def show
  end

  # GET /centers/new
  def new
    @center = Center.new
    @user = User.first
    @general_setting = GeneralSetting.last
  end

  # GET /centers/1/edit
  def edit
  end

  # POST /centers
  # POST /centers.json
  def create
    @center = Center.new(center_params)

    respond_to do |format|
      if @center.save
        format.html { redirect_to @center, notice: 'Center was successfully created.' }
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
      @general_setting = GeneralSetting.last
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:center).permit(:center_name, :address,:country, :city, :state, :pan_card_no, :contact, :alternate_contact, :center_starting_date, :contact_person_name, :residential_address, :center_code)
    end
end
