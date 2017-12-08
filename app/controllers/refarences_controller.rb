class RefarencesController < ApplicationController
  before_action :set_refarence, only: [:show, :edit, :update, :destroy]

  # GET /refarences
  # GET /refarences.json
  def index
    @refarences = Refarence.all
    @general_setting = GeneralSetting.first
    @user = User.first
  end

  # GET /refarences/1
  # GET /refarences/1.json
  def show
  end

  # GET /refarences/new
  def new
    @refarence = Refarence.new
    @general_setting = GeneralSetting.first
    @user = User.first
  end

  # GET /refarences/1/edit
  def edit
  end

  # POST /refarences
  # POST /refarences.json
  def create
    @refarence = Refarence.new(refarence_params)

    respond_to do |format|
      if @refarence.save
        format.html { redirect_to @refarence, notice: 'Refarence was successfully created.' }
        format.json { render :show, status: :created, location: @refarence }
      else
        format.html { render :new }
        format.json { render json: @refarence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refarences/1
  # PATCH/PUT /refarences/1.json
  def update
    respond_to do |format|
      if @refarence.update(refarence_params)
        format.html { redirect_to @refarence, notice: 'Refarence was successfully updated.' }
        format.json { render :show, status: :ok, location: @refarence }
      else
        format.html { render :edit }
        format.json { render json: @refarence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refarences/1
  # DELETE /refarences/1.json
  def destroy
    @refarence.destroy
    respond_to do |format|
      format.html { redirect_to refarences_url, notice: 'Refarence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refarence
      @refarence = Refarence.find(params[:id])
      @general_setting = GeneralSetting.first
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refarence_params
      params.require(:refarence).permit(:name)
    end
end
