# encoding: utf-8
require 'carrierwave'
require 'carrier_wave_model_configuration'

class PdfUploader < CarrierWave::Uploader::Base
  include CarrierWaveModelConfiguration
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # # def default_url
  # #   # For Rails 3.1+ asset pipeline compatibility:
  # #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  # #
  # #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # # end

  # Process files as they are uploaded:
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(pdf)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
