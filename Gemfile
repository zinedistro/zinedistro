source 'https://rubygems.org'

gem "mini_magick", '~> 3.8.1'
gem 'activeadmin', github: 'activeadmin'
gem 'bower-rails', '~> 0.9.0'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise', github: 'plataformatec/devise'
gem 'draper', '~> 1.4.0'
gem 'fog', '~> 1.23.0', require: "fog/aws/storage"
gem 'haml', '~> 4.0.4'
gem 'kaminari', '~> 0.16.1'
gem 'nokogiri', '~> 1.6.3.1'
gem 'pg', '~> 0.17.1'
gem 'rails', '~> 4.2.0'
gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '~> 2.5.3'
gem 'unf', '~> 0.1.4'
gem 'unicorn', '~> 4.8.3'

group :test, :development do
  gem 'capybara', '~> 2.4.1'
  gem 'dotenv-rails', '~> 1.0.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker', '~> 1.4.3'
  gem 'pry', '~> 0.10.1'
  gem 'rspec-rails', '~> 3.1.0'
end

group :test do
  gem "codeclimate-test-reporter", require: false
  gem 'capybara-screenshot', '~> 1.0.3'
  gem 'database_cleaner', '~> 1.4.0'
  gem 'shoulda-matchers', '~> 2.7.0', require: false
  gem 'simplecov', '~> 0.9.1'
  gem 'webmock'
end

group :development do
  # gem 'coffee-rails-source-maps'
  # gem 'sass-rails-source-maps'
  gem 'bullet'
  gem 'guard', '~> 2.6.1'
  gem 'guard-livereload', '~> 2.3.1'
  gem 'guard-rspec', '~> 4.5.0', require: false
  gem 'rb-fchange', '~> 0.0.6',  require: false
  gem 'rb-fsevent', '~> 0.9.4', require: false
  gem 'rb-inotify', '~> 0.9.5', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :production do
  gem "skylight", '~> 0.3.20'
  gem 'rails_12factor', '0.0.2'
end
