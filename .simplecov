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

  minimum_coverage 100
end if ENV["COVERAGE"] || ENV['CI']
