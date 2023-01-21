require File.expand_path('../boot', __FILE__)

# Require only the libraries we are using
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require 'active_resource/railtie'
require 'sprockets/railtie'

Bundler.require(:default, Rails.env)

unless Rails.env.production?
  require File.expand_path("#{File.dirname(__FILE__)}/initializers/dotenv.rb")
end

module ZineDistro
  # ZineDistro configuration
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework(:rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       feature_specs: true)
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.helper false
      g.template_engine :haml
      g.stylesheets false
      g.stylesheet_engine = :sass
    end

    # Settings in config/environments/* take precedence over those specified
    # here.  Application configuration should go into files in
    # config/initializers -- all .rb files in that directory are automatically
    # loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/lib)

    # Set Time.zone default to the specified zone and make Active Record
    # auto-convert to this zone.  Run "rake -D time" for a list of tasks for
    # finding time zone names. Default is UTC.
    config.time_zone = 'Pacific Time (US & Canada)'

    # The default locale is :en and all translations from
    # config/locales/*.rb,yml are auto loaded.  config.i18n.load_path +=
    # Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = 'utf-8'

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Use SQL instead of Active Record's schema dumper when creating the
    # database.
    config.active_record.schema_format = :sql

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    config.i18n.available_locales = [:en]
    config.i18n.default_locale = :en
    # This is necessary if your schema can't be completely dumped by the schema
    # dumper, like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Version of your assets, change this if you want to expire all your assets
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.assets.initialize_on_precompile = false

    # Add the fonts to asset pipeline
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.precompile += %w( .svg .eot .woff .ttf )

    # Add assets packaged by bower to asset pipeline
    config.assets.paths << Rails.root.join('vendor',
                                           'assets',
                                           'bower_components')
  end
end
