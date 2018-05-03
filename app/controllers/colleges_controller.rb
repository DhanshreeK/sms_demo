class CollegesController < ApplicationController
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  # GET /colleges
  # GET /colleges.json
  def index
    @colleges = College.all
    if params[:search]
    @colleges = College.search(params[:search])
  else
     @colleges = College.all
   end
  end

 
  def show
  end

  def new
    @college = College.new
  end

  def new1
    @college = College.new
    @colleges = College.all
    
  end

  def find_budget
    @colleges = College.all
    @budgets = Budget.all

    @budget = Budget.find(params[:budget_id])

    @budget_from = @budget.budget_from.to_i
    @budget_to = @budget.budget_to.to_i
  end


  def edit
  end

  def create
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: 'College was successfully created.' }
        format.json { render :show, status: :created, location: @college }
      else
        format.html { render :new }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to @college, notice: 'College was successfully updated.' }
        format.json { render :show, status: :ok, location: @college }
      else
        format.html { render :edit }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @college.destroy
    respond_to do |format|
      format.html { redirect_to colleges_url, notice: 'College was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit(:name, :city, :country , :fees, :budget_id)
    end
end
