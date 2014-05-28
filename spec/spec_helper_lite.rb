require 'rspec/core'
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
