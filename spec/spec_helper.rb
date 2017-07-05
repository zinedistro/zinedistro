require 'rspec/core'
require 'pry'

ENV['RAILS_ENV'] ||= 'test'

def rails_loaded?
  Object.const_defined?(:ZineDistro) &&
    ZineDistro.const_defined?(:Application)
end

unless rails_loaded?
  alias require_dependency require

  def require_initializer name
    require File.expand_path("#{File.dirname(__FILE__)}\
                            /../config/initializers/#{name}.rb")
  end

  require_initializer 'dotenv'
end

RSpec.configure do |config|
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
