require 'spec_helper'

describe CoverImageUploader do

  def fixture_image
    File.open(File.join(Rails.root, '/spec/fixtures/images/transparent.png'))
  end

  let(:cover_image) { described_class.new }

  before do
    cover_image.stub_chain(:model, :id) { ::SecureRandom.hex }
    cover_image.store! fixture_image
  end

  context 'test env' do
    it 'uploads the cover image to the correct bucket' do
      cover_image.file.url.should match(/.*\/zinedistro-test.*/)
    end
  end
end
