class UserMailer < ApplicationMailer
 
  def welcome_email(email)
    @email = email
    if @email.attachment.present?
      attachments[@email.attachment.filename] = File.read(@email.attachment.file.file)
    end 
    if @email.attachment2.present?
      attachments[@email.attachment2.filename] = File.read(@email.attachment2.file.file)
    end
    
    # attachments.inline['camper-bowtie.png'] = File.read('/uploads/attachment/picture/15/camper-bowtie.png')

    @recipients = []
    @email.selected_emails.each do |e|
    @recipients << e.customer_email.email
  end
  mail(to: @recipients, subject: @email.sub) 
  end 
end