source 'https://rubygems.org'
gem 'nokogiri', '~> 1.6.3.1'

gem 'rails', '~> 4.1.6'

# Infrastructure gems
gem 'pg'
gem 'unicorn'

# Assets
gem 'sass-rails', '~> 4.0.1'
gem 'coffee-rails', '~> 4.0.1'
gem 'uglifier', '~> 2.5.3'
gem 'haml', '~> 4.0.4'

group :test, :development do
  gem 'rspec-rails', github: 'rspec/rspec-rails', branch: 'master', ref: 'b8680f98858598b5423e13765676773fe587288b'
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

# ActiveAdmin
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise', github: 'plataformatec/devise'
gem 'responders', github: 'plataformatec/responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack', '~> 1.3.0'
gem 'formtastic', github: 'justinfrench/formtastic'

# Decorators
gem 'draper', '~> 1.4.0'

# Pagination
gem 'kaminari', '~> 0.16.1'

# Image uploading
gem 'carrierwave'
gem 'fog', '~> 1.23.0', require: "fog/aws/storage"
gem 'unf'

# Image processing
gem "mini_magick", '~> 3.8.1'

# Frontend assets
gem 'bower-rails', '~> 0.8.3'

# Code quality
gem 'coveralls', '~> 0.7.1', require: false
