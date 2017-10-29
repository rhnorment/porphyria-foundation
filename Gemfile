source 'https://rubygems.org'

ruby '2.3.1'

gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_editor', github: 'boontdustie/active_admin_editor'
# gem 'chosen_rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'delayed_job_active_record'
gem 'email_validator'
gem 'devise'
gem 'faker'
gem 'flutie'
gem 'i18n-tasks'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'jquery-rails'
gem 'kaminari'
gem 'newrelic_rpm', '>= 3.9.8'
gem 'rack-canonical-host'
gem 'rails', '~> 5.0.0'
gem 'recipient_interceptor'
gem 'refills'
gem 'spreadsheet'
gem 'title'
gem 'uglifier'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bundler-audit', require: false
  gem 'byebug'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'populator'
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'formulaic'
  gem 'launchy'
  gem 'rake'
  gem 'rails-controller-testing'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'rack-timeout'
  gem 'pg'
  gem 'puma'
end



