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
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker', '~> 1.4.3'
  gem 'capybara', '~> 2.4.1'
  gem 'dotenv-rails'
  gem 'pry', '~> 0.10.1'
end

group :test do
  # Take screenshots during/after failed feature specs
  gem 'capybara-screenshot', '1.0.1'

  # Test coverage
  gem 'simplecov', '~> 0.9.1'

  # Database truncation for test isolation
  gem 'database_cleaner', '~> 1.3.0'

  # Test Helpers
  gem 'shoulda-matchers', '~> 2.7.0', require: false
end

group :development do
  # Preloading the rails envionment
  gem 'spring'
  gem 'spring-commands-rspec'

  # Filesystem watcher for autotest, etc
  gem 'guard', '~> 2.6.1'
  gem 'guard-rspec', '~> 4.3.1', github: 'guard/guard-rspec', branch: 'master'

  # Watching for file changes
  gem 'rb-inotify', '~> 0.9.5', require: false
  gem 'rb-fsevent', '~> 0.9.4', require: false
  gem 'rb-fchange', '~> 0.0.6',  require: false

  gem 'guard-livereload', '~> 2.3.1'

  # Database query optimization
  gem 'bullet', '4.13.2'

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
gem 'ransack', '~> 1.4.1'
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

# Heroku
gem 'rails_12factor', group: :production
