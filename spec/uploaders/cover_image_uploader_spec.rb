require "rails_helper"

describe CoverImageUploader do

  def fixture_image
    File.open(File.join(Rails.root, '/spec/fixtures/images/transparent.png'))
  end

  let(:cover_image) { described_class.new }

  before do
    allow(cover_image).to receive_message_chain(:model, :id)
      .and_return(::SecureRandom.hex)
    cover_image.store! fixture_image
  end

  context 'test env' do
    it 'uploads the cover image to the correct bucket' do
      expect(cover_image.file.url).to match(/^#{ENV['CARRIERWAVE_ASSET_HOST']}/)
    end
  end
end
