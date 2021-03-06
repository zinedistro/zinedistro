ruby ENV['CUSTOM_RUBY_VERSION'] || `cat .ruby-version`.chomp
source 'https://rubygems.org'

gem 'rails'

gem 'activeadmin', '~> 1.0.0.pre4'
gem 'bower-rails'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise', '~> 3.5.1'
gem 'draper', '~> 2.1.0'
gem 'fog-aws'
gem 'haml', '~> 4.0.4'
gem 'kaminari', '~> 0.16.1'
gem 'mini_magick'
gem 'newrelic_rpm', group: [:development]
gem 'nokogiri', '> 1.6.6.4'
gem 'pg', '~> 0.18.1'
gem 'puma'
gem 'rack-timeout'
gem 'responders', '~> 2.0'
gem 'sass-rails', '~> 5.0.1'
gem 'uglifier', '~> 2.7.0'
gem 'unf', '~> 0.1.4'
gem 'utf8-cleaner'
gem 'select2-rails'

group :test, :development do
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rb-readline'
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
  # gem 'coffee-rails-source-maps'
  # gem 'sass-rails-source-maps'
  gem 'bullet'
  gem 'foreman'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec', require: false
  gem 'overcommit'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'rubocop', '~> 0.49.1', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'travis'
end

group :production do
  gem 'skylight'
  gem 'rails_12factor'
  gem 'bugsnag'
  gem 'heroku_rails_deflate'
  gem 'readthis'
  gem 'hiredis'
end
