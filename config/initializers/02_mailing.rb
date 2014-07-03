Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :user_name => 'me@mikakalathil.ca',
    :password => ENV['MANDRILL_API_KEY'],
    :domain => 'localhost',
    :address => 'smtp.mandrillapp.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end
