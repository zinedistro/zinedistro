require 'webmock/rspec'
if ENV['COVERAGE'] || ENV['CI']
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter '/spec/'
    add_filter '/config/'
    add_filter '/lib/'
    add_filter '/vendor/'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Helpers', 'app/helpers'
    add_group 'Mailers', 'app/mailers'
    add_group 'Views', 'app/views'
    add_group 'Decorators', 'app/decorators'
    add_group 'ActiveAdmin', 'app/admin'
    add_group 'Uploaders', 'app/uploaders'

    minimum_coverage 95
  end
end
if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'spec_helper'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

Kaminari.configure { |c| c.default_per_page = 2 }
Capybara.asset_host = 'http://localhost:3000'
Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow: 'codeclimate.com', allow_localhost: true)

RSpec.configure do |config|
  config.include Capybara::DSL

  # Use create :factory instead of FactoryGirl.create :factory
  config.include FactoryGirl::Syntax::Methods

  # Prevent Rspec-Rails from implicitly wrapping tests in database transactions
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # File-type inference disabled by default
  # https://www.relishapp.com/rspec/rspec-rails/docs/upgrade#file-type-inference-disabled
  config.infer_spec_type_from_file_location!

  # Allow the use of t() instead of I18n.t() in tests
  config.include AbstractController::Translation

  # Turn deprications into errors with stacktraces
  config.raise_errors_for_deprecations!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
