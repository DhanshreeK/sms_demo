class SubadminsController < ApplicationController
  before_action :set_subadmin, only: [:show, :edit, :update, :destroy]

  # GET /subadmins
  # GET /subadmins.json
  def index
    @subadmins = Subadmin.all
  end

  # GET /subadmins/1
  # GET /subadmins/1.json
  def show
  end

  # GET /subadmins/new
  def new
    @subadmin = Subadmin.new
    @subadmin.subadmin_no
  end

  # GET /subadmins/1/edit
  def edit
  end

  # POST /subadmins
  # POST /subadmins.json
  def create
    @subadmin = Subadmin.new(subadmin_params)

    respond_to do |format|
      if @subadmin.save
        format.html { redirect_to @subadmin, notice: 'Subadmin was successfully created.' }
        format.json { render :show, status: :created, location: @subadmin }
      else
        format.html { render :new }
        format.json { render json: @subadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subadmins/1
  # PATCH/PUT /subadmins/1.json
  def update
    respond_to do |format|
      if @subadmin.update(subadmin_params)
        format.html { redirect_to @subadmin, notice: 'Subadmin was successfully updated.' }
        format.json { render :show, status: :ok, location: @subadmin }
      else
        format.html { render :edit }
        format.json { render json: @subadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subadmins/1
  # DELETE /subadmins/1.json
  def destroy
    @subadmin.destroy
    respond_to do |format|
      format.html { redirect_to subadmins_url, notice: 'Subadmin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subadmin
      @subadmin = Subadmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subadmin_params
      params.require(:subadmin).permit(:name, :email, :subadmin_number)
    end
end
