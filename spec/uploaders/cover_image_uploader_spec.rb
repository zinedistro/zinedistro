# frozen_string_literal: true

require 'rails_helper'

describe CoverImageUploader do
  let(:instance) { described_class.new }

  before do
    CoverImageUploader.enable_processing = true
    allow(instance).to(
      receive_message_chain(:model, :id).and_return(::SecureRandom.hex)
    )
    instance.store! fixture_png_image
  end

  after do
    CoverImageUploader.enable_processing = false
    instance.remove!
  end

  context 'test env' do
    it 'uploads the cover image to the correct bucket' do
      expect(instance.file.url).to match(/^#{ENV['CARRIERWAVE_ASSET_HOST']}/)
    end

    it 'allows the image to be converted to jpg' do
      instance.convert(:jpg)
      expect(instance.file.extension).to eq('jpg')
    end

    it 'allows the images to be converted to png' do
      instance.convert(:png)
      expect(instance.file.extension).to eq('png')
    end

    it 'allows the images to be converted to png' do
      instance.convert(:gif)
      expect(instance.file.extension).to eq('gif')
    end

    it 'allows the images to be converted to jpeg' do
      instance.convert(:jpeg)
      expect(instance.file.extension).to eq('jpeg')
    end
  end
end
