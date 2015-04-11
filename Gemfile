ruby '2.2.1'
source 'https://rubygems.org'

gem 'activeadmin', github: 'activeadmin'
gem 'bower-rails', '~> 0.9.0'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise', github: 'plataformatec/devise'
gem 'draper', '~> 1.4.0'
gem 'fog', '~> 1.27.0', require: 'fog/aws/storage'
gem 'haml', '~> 4.0.4'
gem 'kaminari', '~> 0.16.1'
gem 'mini_magick', '~> 4.0.3'
gem 'newrelic_rpm', group: [:development, :production]
gem 'nokogiri', '~> 1.6.6.2'
gem 'pg', '~> 0.18.1'
gem 'rack-timeout'
gem 'rails', '~> 4.2.0'
gem 'sass-rails', '~> 5.0.1'
gem 'uglifier', '~> 2.7.0'
gem 'unf', '~> 0.1.4'
gem 'unicorn', '~> 4.8.3'
gem 'utf8-cleaner', '~> 0.0.9'

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
  gem 'shoulda-matchers', require: false
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
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :production do
  gem "skylight", '~> 0.6.0'
  gem 'rails_12factor', '0.0.3'
  gem 'bugsnag'
  gem 'heroku_rails_deflate'
end
