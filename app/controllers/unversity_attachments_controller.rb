class UnversityAttachmentsController < ApplicationController
  before_action :set_unversity_attachment, only: [:show, :edit, :update, :destroy]

  # GET /unversity_attachments
  # GET /unversity_attachments.json
  def index
    @unversity_attachments = UnversityAttachment.all
      @general_setting = GeneralSetting.first
    @user = User.first
  end

  # GET /unversity_attachments/1
  # GET /unversity_attachments/1.json
  def show
  end

  # GET /unversity_attachments/new
  def new
    @unversity_attachment = UnversityAttachment.new
      @general_setting = GeneralSetting.first
    @user = User.first
  end

  # GET /unversity_attachments/1/edit
  def edit
  end

  # POST /unversity_attachments
  # POST /unversity_attachments.json
  def create
    @unversity_attachment = UnversityAttachment.new(unversity_attachment_params)

    respond_to do |format|
      if @unversity_attachment.save
        format.html { redirect_to @unversity_attachment, notice: 'Unversity attachment was successfully created.' }
        format.json { render :show, status: :created, location: @unversity_attachment }
      else
        format.html { render :new }
        format.json { render json: @unversity_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unversity_attachments/1
  # PATCH/PUT /unversity_attachments/1.json
  def update
    respond_to do |format|
      if @unversity_attachment.update(unversity_attachment_params)
        format.html { redirect_to @university_attachment.university, notice: 'Unversity attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @unversity_attachment }
      else
        format.html { render :edit }
        format.json { render json: @unversity_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unversity_attachments/1
  # DELETE /unversity_attachments/1.json
  def destroy
    @unversity_attachment.destroy
    respond_to do |format|
      format.html { redirect_to unversity_attachments_url, notice: 'Unversity attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unversity_attachment
      @unversity_attachment = UnversityAttachment.find(params[:id])
      @general_setting = GeneralSetting.first
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unversity_attachment_params
      params.require(:unversity_attachment).permit(:university_id, :attachment)
    end
end
