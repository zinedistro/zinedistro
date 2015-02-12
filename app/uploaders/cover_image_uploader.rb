# encoding: utf-8
require 'fog/aws/storage'
require 'carrierwave'
require 'carrier_wave_model_configuration'

class CoverImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveModelConfiguration
  include Cloudinary::CarrierWave

  # Process files as they are uploaded:
  version :list_view do
    process :eager => true
    process :resize_to_fit =>  [150, 200]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end
end
