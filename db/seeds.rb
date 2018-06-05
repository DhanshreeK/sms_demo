gs = GeneralSetting.create!(registered_name: 'Vishwa Vidya consultancy Pvt. Ltd.')
sms = SmsSetting.create!(body: 'Dear Student, you are requested to submit the admission form along with the registration fees to confirm your admission.
Dear student, you are requested to submit documents for further process.')
email = EmailSetting.create!(body: 'Dear Students,
 
Your admission,
                     Your admission in ____________ University is confirmed and your enrolment number for the same is ___________.
 
You can check you admission on (website)
 
Regards,
Vishwa Education
7030306611')
user = User.create!(:email => 'edu@admin.in', :password => '123456789', :password_confirmation => '123456789', general_setting_id: gs.id, role: 'SuperAdmin',sms_setting_id: sms.id, email_setting_id: email.id)
require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("country.csv"), headers: true) do |row|
  Country.create! do |country|
  	byebug
    country.id = row[3]
    country.country = row[4]
 end
end

puts "Importing colleges..."
 CSV.foreach(Rails.root.join("colleges.csv"), headers: true) do |row|
  MedicalCollege.create! do |state|
  	state.country_id = row[0]

     state.college_name = row[1]
        end
    end