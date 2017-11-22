class StudentMailer < ApplicationMailer
default from: 'demo.qset@gmail.com'
 
  def welcome_email(student)
    @student = student
    mail(to: @student.email, subject: 'Welcome to My Awesome Site')
  end
end
