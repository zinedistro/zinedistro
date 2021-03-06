# frozen_string_literal: true

require 'rails_helper'

describe PdfUploader do
  let(:instance) { described_class.new }

  before do
    PdfUploader.enable_processing = true
    allow(instance).to(
      receive_message_chain(:model, :id).and_return(::SecureRandom.hex)
    )
    instance.store! fixture_pdf
  end

  after do
    PdfUploader.enable_processing = false
    instance.remove!
  end

  context 'test env' do
    it 'uploads the cover image to the correct bucket' do
      expect(instance.file.url).to match(/^#{ENV['CARRIERWAVE_ASSET_HOST']}/)
    end

    it 'has the correct file extension' do
      expect(instance.file.extension).to eq('pdf')
    end
  end
end
