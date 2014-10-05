require 'fog/aws/storage'
require 'carrierwave'
module CarrierWaveModelConfiguration

  def store_dir
    "#{model.class.to_s.underscore.pluralize}/#{mounted_as.to_s.pluralize}/#{model.id}/"
  end
end
