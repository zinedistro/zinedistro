# encoding: utf-8
require 'fog/aws/storage'
require 'carrierwave'
require 'carrier_wave_model_configuration'

class PdfUploader < CarrierWave::Uploader::Base
  include CarrierWaveModelConfiguration
  include Cloudinary::CarrierWave

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(pdf)
  end
end
