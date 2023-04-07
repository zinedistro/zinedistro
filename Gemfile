ruby ENV['CUSTOM_RUBY_VERSION'] || `cat .ruby-version`.chomp
source 'https://rubygems.org'

gem 'rails'

gem 'activeadmin'
gem 'carrierwave'
gem 'devise'
gem 'draper'
gem 'fog-aws'
gem 'kaminari'
gem 'mini_magick'
gem 'mysql2'
gem 'nokogiri'
gem 'puma'
gem 'rack-timeout'
gem 'responders'
gem 'unf'
gem 'utf8-cleaner'

group :test, :development do
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rb-readline'
  gem 'sprockets-rails'
  gem 'webpacker'
end

group :test do
  gem 'capybara-screenshot'
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'webmock'
end

group :development do
  gem 'bullet'
  gem 'foreman'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec', require: false
  gem 'newrelic_rpm'
  gem 'overcommit'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'planetscale_rails'
end

group :production do
  gem 'skylight'
  gem 'rails_12factor'
  gem 'bugsnag'
  gem 'heroku_rails_deflate'
  gem 'readthis'
  gem 'hiredis'
end
