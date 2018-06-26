class UserMailer < ApplicationMailer
	default from: 'komalmane21@gmail.com'
 
  def welcome_email(email)
    @email = email
    recipients = [@email.to]
	recipients << @email.cc if @email.cc.present?
	recipients << @email.bcc if @email.bcc.present?
   if @email.attachment.present?
    attachments[@email.attachment.filename] = File.read(@email.attachment.file.file)
end
if @email.attachment2.present?
    attachments[@email.attachment2.filename] = File.read(@email.attachment2.file.file)
end
   
    mail(to: recipients, subject: @email.sub)
    
    
  end



  
end
