bucket_suffix = -> { Rails.env.production? ? '' : Rails.env.to_s }
current_bucket = ENV['CARRIERWAVE_DIRECTORY'] + "-#{bucket_suffix[]}"


CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: ENV['CARRIERWAVE_PROVIDER'],
    aws_access_key_id: ENV['CARRIERWAVE_AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['CARRIERWAVE_AWS_SECRET_ACCESS_KEY'],
    region: ENV['CARRIERWAVE_REGION'],
    endpoint: ENV['CARRIERWAVE_ENDPOINT']
  }
  config.fog_directory  = current_bucket
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
  config.asset_host     = ENV['CARRIERWAVE_ASSET_HOST']
end

if Rails.env.test?
  Fog.mock!
  CarrierWave.configure do |config|
    config.enable_processing = false
  end

  connection = Fog::Storage.new(CarrierWave::Uploader::Base.fog_credentials)
  connection.directories.create(:key => current_bucket)
end
