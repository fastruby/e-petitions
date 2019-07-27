def next?
  File.basename(__FILE__) == "Gemfile.next"
end
source 'https://rubygems.org'

# Load environment variables
gem 'dotenv-rails', :require => 'dotenv/rails-now'

if next?
  gem 'rails', '~> 5.0.1'
else
  gem 'rails', '4.2.11.1'
end

gem 'rake'
gem 'pg', '< 0.21'
gem 'authlogic', '~> 3.6.1'
gem 'will_paginate'
gem 'json'
gem 'delayed_job_active_record'
gem 'whenever'
gem 'appsignal'
gem 'dynamic_form'
gem 'faraday'
gem 'faraday_middleware'
gem 'net-http-persistent'
gem 'sass-rails', '~> 5.0'
gem 'textacular'
gem 'uglifier'
gem 'bcrypt'
gem 'faker'
gem 'slack-notifier'
gem 'daemons', '~> 1.2.5'
gem 'jquery-rails'
gem 'delayed-web'
gem 'dalli', '2.7.6'
gem 'connection_pool'
gem 'lograge'
gem 'logstash-logger'
gem 'jbuilder'
gem 'paperclip', '~> 5.3'
gem 'maxminddb'
gem 'redcarpet'

gem 'aws-sdk', '~> 2.0'

group :development, :test do
  gem 'next_rails', '~> 1.0.1'
  gem 'simplecov'
  gem 'brakeman', '~> 4.5.1', require: false
  gem 'bundler-audit', require: false
  gem 'rspec-rails'
  gem 'jasmine-rails'
  gem 'pry'
end

group :test do
  gem 'nokogiri'
  gem 'shoulda-matchers'
  gem 'pickle'
  gem 'cucumber', '~> 2.4.0'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', '~> 1.6.0'
  gem 'capybara', '~> 3.13.2'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'email_spec'
  gem 'launchy'
  gem 'webdrivers', '~> 3.8.1'
  gem 'webmock'
  gem 'test_after_commit' unless next?
end

group :production do
  gem 'puma'
end
