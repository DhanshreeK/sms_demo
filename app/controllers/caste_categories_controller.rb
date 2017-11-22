class CasteCategoriesController < ApplicationController
  before_action :set_caste_category, only: [:show, :edit, :update, :destroy]

  # GET /caste_categories
  # GET /caste_categories.json
  def index
    @caste_categories = CasteCategory.all
     @general_setting = GeneralSetting.first
    @user = User.first
  end

  # GET /caste_categories/1
  # GET /caste_categories/1.json
  def show
  end

  # GET /caste_categories/new
  def new
    @caste_category = CasteCategory.new
     @general_setting = GeneralSetting.first
    @user = User.first
  end

  # GET /caste_categories/1/edit
  def edit
  end

  # POST /caste_categories
  # POST /caste_categories.json
  def create
    @caste_category = CasteCategory.new(caste_category_params)

    respond_to do |format|
      if @caste_category.save
        format.html { redirect_to @caste_category, notice: 'Caste category was successfully created.' }
        format.json { render :show, status: :created, location: @caste_category }
      else
        format.html { render :new }
        format.json { render json: @caste_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caste_categories/1
  # PATCH/PUT /caste_categories/1.json
  def update
    respond_to do |format|
      if @caste_category.update(caste_category_params)
        format.html { redirect_to @caste_category, notice: 'Caste category was successfully updated.' }
        format.json { render :show, status: :ok, location: @caste_category }
      else
        format.html { render :edit }
        format.json { render json: @caste_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caste_categories/1
  # DELETE /caste_categories/1.json
  def destroy
    @caste_category.destroy
    respond_to do |format|
      format.html { redirect_to caste_categories_url, notice: 'Caste category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caste_category
      @caste_category = CasteCategory.find(params[:id])
       @general_setting = GeneralSetting.first
    @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caste_category_params
      params.require(:caste_category).permit(:name)
    end
end
