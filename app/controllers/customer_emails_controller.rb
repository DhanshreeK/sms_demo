class CustomerEmailsController < ApplicationController
  before_action :set_customer_email, only: [:show, :edit, :update, :destroy]

  # GET /customer_emails
  # GET /customer_emails.json
  def index
    @customer_emails = CustomerEmail.all
  end


  #import Email
  def import
    if params[:file].present?
    CustomerEmail.import(params[:file])
    redirect_to customer_emails_path, notice: "Email imported."
    else
       flash[:notice] = "Please Select File"
       redirect_to customer_emails_path
    end
  end

  # GET /customer_emails/1
  # GET /customer_emails/1.json
  def show
  end

  # GET /customer_emails/new
  def new
    @customer_email = CustomerEmail.new
  end

  # GET /customer_emails/1/edit
  def edit
  end

  # POST /customer_emails
  # POST /customer_emails.json
  def create
    @customer_email = CustomerEmail.new(customer_email_params)

    respond_to do |format|
      if @customer_email.save
        format.html { redirect_to @customer_email, notice: 'Customer email was successfully created.' }
        format.json { render :show, status: :created, location: @customer_email }
      else
        format.html { render :new }
        format.json { render json: @customer_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_emails/1
  # PATCH/PUT /customer_emails/1.json
  def update
    respond_to do |format|
      if @customer_email.update(customer_email_params)
        format.html { redirect_to @customer_email, notice: 'Customer email was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_email }
      else
        format.html { render :edit }
        format.json { render json: @customer_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_emails/1
  # DELETE /customer_emails/1.json
  def destroy
    @customer_email.destroy
    respond_to do |format|
      format.html { redirect_to customer_emails_url, notice: 'Customer email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_email
      @customer_email = CustomerEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_email_params
      params.require(:customer_email).permit(:email)
    end
end
