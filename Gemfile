source 'https://rubygems.org'
gem 'nokogiri'

gem 'rails', github: 'rails/rails', branch: '4-1-stable'

# Infrastructure gems
gem 'pg'
gem 'unicorn'

# Assets
gem 'sass-rails', '~> 4.0.1'
gem 'coffee-rails', '~> 4.0.1'
gem 'uglifier', '~> 2.4.0'
gem 'haml', '~> 4.0.4'

group :test, :development do
  gem 'rspec-rails', '~> 3.0.0.beta2'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker'
  gem 'capybara', github: 'jnicklas/capybara', branch: 'master'
  gem 'dotenv-rails'
  gem 'pry'
end

group :test do
  # Take screenshots during/after failed feature specs
  gem 'capybara-screenshot'

  # Test coverage
  gem 'simplecov'

  # Database truncation for test isolation
  gem 'database_cleaner'

  # Test Helpers
  gem 'shoulda-matchers', require: false
end

group :development do
  # Preloading the rails envionment
  gem 'spring'
  gem 'spring-commands-rspec'

  # Filesystem watcher for autotest, etc
  gem 'guard'
  gem 'guard-rspec'

  # Watching for file changes
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false

  gem 'guard-livereload'

  # Database query optimization
  gem 'bullet'

  # TODO: https://github.com/vhyza/sass-rails-source-maps/issues/6
  # Source maps for SASS and CoffeeScript
  # gem 'coffee-rails-source-maps'
  # gem 'sass-rails-source-maps'
end

# Private inheritance
gem 'fig_leaf'

# ActiveAdmin
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise', github: 'plataformatec/devise'
gem 'responders', github: 'plataformatec/responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack'
gem 'formtastic', github: 'justinfrench/formtastic'

# Decorators
gem 'draper'

# Pagination
gem 'kaminari'

# Image uploading
gem 'carrierwave'
gem 'fog', require: "fog/aws/storage"
gem 'unf'

# Image processing
gem "mini_magick"

# Frontend assets
gem 'bower-rails'

# Code quality
gem 'coveralls', require: false
