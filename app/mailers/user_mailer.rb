class UserMailer < ApplicationMailer
 
  def welcome_email(email)
    @email = email
    if @email.attachment.present?
      attachments[@email.attachment.filename] = File.read(@email.attachment.file.file)
    end 
    if @email.attachment2.present?
      attachments[@email.attachment2.filename] = File.read(@email.attachment2.file.file)
    end
    @recipients = []
    @email.selected_emails.each do |e|
    @recipients << e.customer_email.email
    # send_file( "uploads/store/#{params[:filename]}.png",
    # :disposition => 'inline',
    # :type => 'image/png',
    # :x_sendfile => true )

	  # @recipients << @email.cc if @email.cc.present?
	  # @recipients << @email.bcc if @email.bcc.present?
    
  end
  mail(to: @recipients, subject: @email.sub) 
  end 
end