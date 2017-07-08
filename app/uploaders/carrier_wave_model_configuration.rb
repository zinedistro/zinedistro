# frozen_string_literal: true

require 'fog/aws'
require 'carrierwave'
module CarrierWaveModelConfiguration
  def store_dir
    "#{model.class.to_s.underscore.pluralize}/#{mounted_as.to_s.pluralize}/#{model.id}/"
  end
end
