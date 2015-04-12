begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
  Rails.logger.warn 'Unable to load dotenv. Proceeding without it...'
end
