# frozen_string_literal: true

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
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'unf'
gem 'utf8-cleaner'

group :test, :development do
  gem 'capybara'
  gem 'cssbundling-rails'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rb-readline'
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
  gem 'bullet'
  gem 'foreman'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec', require: false
  gem 'newrelic_rpm'
  gem 'overcommit'
  gem 'planetscale_rails'
  gem 'prettier_print', require: false
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'rubocop', require: false
  gem 'rubocop-config-prettier', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'syntax_tree', require: false
  gem 'syntax_tree-haml', require: false
  gem 'syntax_tree-rbs', require: false
end

group :production do
  gem 'bugsnag'
  gem 'hiredis'
  gem 'rails_12factor'
  gem 'readthis'
  gem 'skylight'
end
