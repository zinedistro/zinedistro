source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'
# gem 'unicorn'

# Infrastructure gems
gem 'pg'
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
  gem "factory_girl_rails", "~> 4.0"
  gem 'faker'
  gem "capybara"
end

group :test do
  gem 'simplecov'
  gem 'database_cleaner'
end

group :development do
  gem 'guard'
  gem 'guard-zeus'
  gem 'zeus'
  gem 'guard-rspec'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
end

gem 'activeadmin', github: 'gregbell/active_admin', branch: 'rails4'
gem 'devise', '3.0.0.rc'
gem 'responders',          github: 'plataformatec/responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack',             github: 'ernie/ransack',            branch: 'rails-4'
gem 'formtastic',          github: 'justinfrench/formtastic', branch: 'rails4beta'
