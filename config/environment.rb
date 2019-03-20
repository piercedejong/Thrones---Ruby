# Load the Rails application.
require_relative 'application'

Rails.application.configure do
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { :host => "yourhost" }
  config.action_mailer.default_options = {from: 'wwdeathpool@gmail.com'}
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
   :address              => "smtp.gmail.com",
   :port                 => 587,
   :user_name            => ENV['GMAIL_USERNAME'],
   :password             => ENV['GMAIL_PASSWORD'],
   :authentication       => "plain",
  :enable_starttls_auto => true
  }
end
# Initialize the Rails application.
Rails.application.initialize!
