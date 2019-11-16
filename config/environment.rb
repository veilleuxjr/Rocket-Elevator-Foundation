# Load the Rails application.
require_relative 'application'




# Initialize the Rails application.
userName = ENV["SENGRID_USERNAME"]
password = ENV["SENGRID_PASSWORD"]
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
    :user_name => userName,
    :password => password,
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

