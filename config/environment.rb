# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
# ActionMailer::Base.smtp_settings = {
#   :user_name => 'dhanshree.j.kamble@gmail.com',
#   :password => 'dhanulovesmomdad2692',
#   :domain => 'localhost:3000',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }



ActionMailer::Base.smtp_settings = {
  :user_name => 'komalmane21@gmail.com',
  :password => 'komya@2121',
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
