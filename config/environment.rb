# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!



ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}