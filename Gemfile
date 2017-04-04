ruby_version = File.open('.ruby-version').read.chomp
ruby ENV['CUSTOM_RUBY_VERSION'] || ruby_version
source 'https://rubygems.org'

gem 'activeadmin', '~> 1.0.0.pre5'
gem 'bower-rails'
gem 'carrierwave'
gem 'coffee-rails'
gem 'devise', '~> 4.2.1'
gem 'draper', '~> 3.0.0.pre1'
gem 'fog-aws'
gem 'haml'
gem 'inherited_resources'
gem 'kaminari'
gem 'mini_magick'
gem 'newrelic_rpm', group: [:development]
gem 'nokogiri'
gem 'pg'
gem 'puma'
gem 'rack-timeout'
gem 'rails', '~> 5.0.2'
gem 'sass-rails'
gem 'uglifier'
gem 'unf'
gem 'utf8-cleaner'

group :test, :development do
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
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
