require 'spec_helper'

describe ZineDecorator do
  describe '#link_to_cover_image_tag' do

    context 'with a cover image' do
      subject do
        described_class
                .new(build :zine, cover_url: 'http://flurp.com')
      end
      it 'returns an image tag for the image' do
        subject.link_to_cover_image_tag
          .should eq '<img alt="Flurp" src="http://flurp.com" />'
      end
    end

    context 'without a cover image' do
      subject { described_class.new(build :zine, cover_url: nil) }
      it 'returns the default image' do
        subject.link_to_cover_image_tag
        .should eq '<img alt="Missing zine cover" src="http://assets.zinedistro.org/zines/covers/missing.png" />'
      end
    end
  end
end
