RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{File.dirname(__FILE__)}/spec/fixtures"

  Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each { |f| require f }
end
