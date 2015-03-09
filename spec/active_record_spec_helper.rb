require 'spec_helper'
require 'faker'
require 'yaml'
require 'active_record'
require 'factory_girl'
require 'rack/test'
require 'shoulda/matchers'
require 'webmock/rspec'
require 'pry'

WebMock.disable_net_connect! unless ENV['CI']

require_relative './support/configure_transactions.rb'
require_relative './support/upload_helper.rb'
unless rails_loaded?
  $LOAD_PATH.unshift File.expand_path '../../app/models', __FILE__
  $LOAD_PATH.unshift File.expand_path '../../app/uploaders', __FILE__

  %w( carrierwave i18n ).each do |name|
    require File.expand_path("#{File.dirname(__FILE__)}\
                             /../config/initializers/#{name}.rb")
  end

  connection_info = YAML.load(ERB.new(File.read('config/database.yml')).result)
  ActiveRecord::Base.establish_connection(connection_info['test'])

  app_translations = Dir[
    File.expand_path("#{File.dirname(__FILE__)}/../config/locales/*.yml")
  ]

  faker_root = Gem.loaded_specs['faker'].full_gem_path
  faker_translations = Dir[
    File.expand_path(File.join(faker_root, 'lib/locales/*.yml'))
  ]

  I18n.load_path << faker_translations
  I18n.load_path << app_translations

  require_relative './support/factory_girl.rb'
end
