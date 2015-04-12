begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
  logger.warn 'Unable to load dotenv. Proceeding without it...'
end
