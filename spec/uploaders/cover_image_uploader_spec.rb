require "rails_helper"

describe CoverImageUploader do

  def fixture_image
    File.open(File.join(Rails.root, '/spec/fixtures/images/transparent.png'))
  end

  let(:instance) { described_class.new }

  before do
    CoverImageUploader.enable_processing = true
    allow(instance).to receive_message_chain(:model, :id)
      .and_return(::SecureRandom.hex)
    instance.store! fixture_image
  end

  after do
    CoverImageUploader.enable_processing = false
    instance.remove!
  end

  context 'test env' do
    it 'uploads the cover image to the correct bucket' do
      expect(instance.file.url).to match(/^#{ENV['CARRIERWAVE_ASSET_HOST']}/)
    end

    it "allows the image to be converted to jpg" do
      instance.convert(:jpg)
      expect(instance.file.extension).to eq('jpg')
    end

    it "allows the images to be converted to png" do
      instance.convert(:png)
      expect(instance.file.extension).to eq('png')
    end

    it "allows the images to be converted to png" do
      instance.convert(:gif)
      expect(instance.file.extension).to eq('gif')
    end

    it "allows the images to be converted to jpeg" do
      instance.convert(:jpeg)
      expect(instance.file.extension).to eq('jpeg')
    end

    it "does not allow the images to be converted to PDF" do
      expect {
        instance.convert(:pdf)
      }.to raise_error { CarrierWave::ProcessingError }
    end
  end
end
