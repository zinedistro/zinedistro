CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               ENV['CARRIERWAVE_PROVIDER'],
    aws_access_key_id:      ENV['CARRIERWAVE_AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['CARRIERWAVE_AWS_SECRET_ACCESS_KEY'],
    region:                 ENV['CARRIERWAVE_REGION']
  }
  config.fog_directory  = ENV['CARRIERWAVE_DIRECTORY']
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
end
