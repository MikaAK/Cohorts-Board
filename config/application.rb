require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'dotenv'
require 'pry'

Dotenv.load ".env.local", ".env"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cohortboard
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    if defined?(Bundler)
      # If you precompile assets before deploying to production, use this line
      Bundler.require *Rails.groups(:assets => %w(development test staging))
      # If you want your assets lazily compiled in production, use this line
      # Bundler.require(:default, :assets, Rails.env)
    end
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.precompile += %w( jpanelmenu.min.js employers.js admin.js welcome.js morphing_buttons.min.js modernizer.min.js )

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
end
