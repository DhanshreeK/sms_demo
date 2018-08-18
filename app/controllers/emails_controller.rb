class EmailsController < ApplicationController
include AmazonSignature
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    #@student = Student.find(params[:id])
    @email = Email.new
    @hash = AmazonSignature::data_hash
  end
  def new1
    @student = Student.find(params[:id])
    @email = Email.new
  end

  def upload
     @attachment = Attachment.new
        @attachment.picture = params[:file]
        @attachment.save

        respond_to do |format|
            format.json { render :json => { status: 'OK', link: @attachment.picture.url}}
        end
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @hash = AmazonSignature::data_hash
    @email = Email.new(email_params)
    respond_to do |format|
      if @email.save
        params[:customer_email_ids].each do |id|
        SelectedEmail.create(customer_email_id: id.to_i, email_id: @email.id)
       end
        UserMailer.welcome_email(@email).deliver
        format.html { redirect_to emails_path, notice: 'Email was successfully sent.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def destroy_multiple
    Email.destroy(params[:email])
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:to, :sub, :body, :student_id , :attachment , :cc ,:bcc ,:attachment2, customer_email_ids: [])
    end
end