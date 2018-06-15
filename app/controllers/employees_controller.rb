class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    if current_user.role == "SuperAdmin"
    @users = User.all
  end
    if current_user.role == 'Center'
      @employees = current_user.center.employees
      @general_setting = GeneralSetting.first
    else
      @employees = Employee.all
      @general_setting = GeneralSetting.first
      @user = User.first
      if params[:param1].present? && params[:param1] == 'false'
      employee = Employee.shod(params[:id])
      employee.update!(employee_status: 'Active')
    elsif params[:param1].present? && params[:param1] == 'true'
       employee = Employee.shod(params[:id])
      employee.update!(employee_status: 'Inactive')  
    end

    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @general_setting = GeneralSetting.first
    @user = User.first
    @employee.emp_no
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        if current_user.role == 'Center'
         @employee.update!(center_id: current_user.center_id)
        end
        if current_user.role == "Employee"  
          @employee.update(center_id: current_user.center_id)
        end
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
      @general_setting = GeneralSetting.first
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:photo, :name,:status,:employee_status, :designation, :adhar_card_no, :contact_no, :alternate_contact_no, :email, :joining_date, :birth_place, :address, :employee_no, :center_id)
    end
end
