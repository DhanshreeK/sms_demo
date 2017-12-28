class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: [:show, :edit, :update, :destroy]

  # GET /enquiries
  # GET /enquiries.json
  def index
    if current_user.role == 'Center'
      @enquiries = current_user.center.enquiries
      @general_setting = GeneralSetting.first
       respond_to do |format|
        format.html
        format.json
        format.js 
        format.csv { send_data @enquiries.to_csv(['full_name','email','contact_no','alternate_contact_no','center_id']) }
        format.xls { send_data @enquiries.to_csv(col_sep: "\t") }
      end
      else
        @enquiries = Enquiry.all
        @general_setting = GeneralSetting.first
        @user = User.first
        respond_to do |format|
        format.html
        format.json
        format.js 
        format.csv { send_data @enquiries.to_csv(['full_name','email','contact_no','alternate_contact_no','center_id']) }
        format.xls { send_data @enquiries.to_csv(col_sep: "\t") }
      end
    end
  end

  # GET /enquiries/1
  # GET /enquiries/1.json
  def show
  end

  # GET /enquiries/new
  def new
    @enquiry = Enquiry.new
    @general_setting = GeneralSetting.first
    @user = User.first
  end

  # GET /enquiries/1/edit
  def edit
  end

  def remark
    @enquiry = Enquiry.find(params[:id])
     @general_setting = GeneralSetting.first
    @user = User.first
  end

    def update_remark
      @enquiry = Enquiry.find(params[:id])
      @remark = params[:enquiry][:remark]
      if @enquiry.update(remark: @remark)
        redirect_to enquiries_path
      end
    end

  # POST /enquiries
  # POST /enquiries.json
  def create
    @enquiry = Enquiry.new(enquiry_params)
    if current_user.role == 'Center'
      @enquiry.update!(center_id: current_user.center.id)
    end
    respond_to do |format|
      if @enquiry.save
        format.html { redirect_to @enquiry, notice: 'Enquiry was successfully created.' }
        format.json { render :show, status: :created, location: @enquiry }
      else
        format.html { render :new }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enquiries/1
  # PATCH/PUT /enquiries/1.json
  def update
    respond_to do |format|
      if @enquiry.update(enquiry_params)
        format.html { redirect_to enquiries_path, notice: 'Enquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @enquiry }
      else
        format.html { render :edit }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquiries/1
  # DELETE /enquiries/1.json
  def destroy
    @enquiry.destroy
    respond_to do |format|
      format.html { redirect_to enquiries_url, notice: 'Enquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
      @general_setting = GeneralSetting.first
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enquiry_params
      params.require(:enquiry).permit(:employee_id,:refarence_id,:remark,:full_name, :email, :contact_no, :alternate_contact_no, :center_id)
    end
end
