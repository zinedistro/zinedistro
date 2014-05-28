ENV['RAILS_ENV'] ||= Rails.env.to_s

require 'fog/aws/storage'
require 'carrierwave'
required_constants = %w{
    RAILS_ENV
    CARRIERWAVE_DIRECTORY
    CARRIERWAVE_PROVIDER
    CARRIERWAVE_AWS_ACCESS_KEY_ID
    CARRIERWAVE_AWS_SECRET_ACCESS_KEY
    CARRIERWAVE_REGION
    CARRIERWAVE_ENDPOINT
    CARRIERWAVE_ASSET_HOST
}

required_constants.each do |const|
  fail "#{const} must be defined" unless ENV["#{const}"]
end

bucket_suffix = -> {
  (ENV['RAILS_ENV'] == 'production' ) ? '' : "-#{ENV['RAILS_ENV']}"
}
current_bucket = ENV['CARRIERWAVE_DIRECTORY'] + bucket_suffix[]

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
  config.cache_dir      = File.expand_path(
    File.join(
      File.dirname(__FILE__), "../../tmp/uploads"
    )
  )
end

if ENV['RAILS_ENV'] == "test"
  Fog.mock!
  CarrierWave.configure do |config|
    config.storage = :fog
    config.enable_processing = false
    config.root = File.expand_path(
      File.join(File.dirname(__FILE__), "../../tmp"))
  end

  connection = Fog::Storage.new(CarrierWave::Uploader::Base.fog_credentials)
  connection.directories.create(:key => current_bucket)
end
