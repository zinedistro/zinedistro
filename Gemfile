source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'
# gem 'unicorn'

# Infrastructure gems
gem 'sqlite3'
gem 'thin'
gem 'slim-rails'

# Assets
gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '>= 3.0.0'
#Rails 4 transition gems
gem 'protected_attributes'

group :test, :development do
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'faker'
end

group :development do
  gem 'guard'
  gem 'guard-zeus'
  gem 'zeus'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
end
