# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!



ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'https://qsetsmsdemo.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}