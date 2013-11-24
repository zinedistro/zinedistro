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
      subject do
        described_class.new(build :zine, cover_url: nil)
      end
      it 'returns the default image' do
        subject.link_to_cover_image_tag
        .should eq '<img alt="Missing zine cover" ' +
        'src="http://assets.zinedistro.org/zines/covers/missing.png" />'
      end
    end
  end

  describe 'sanitized_seo_zine_path' do
    subject do
      described_class.new(create :zine)
    end

    it 'returns a sanitized, seo-friendly url string' do
      subject.sanitized_seo_zine_path
        .should eq '/zines/' +
        "#{subject.object.id}/" +
        "#{subject.object.title.downcase.gsub(' ', '-')}/" +
        "by/author-#{subject.object.authors[0].id}" +
        "-author-#{subject.object.authors[1].id}-" +
        "and-author-#{subject.object.authors[2].id}"
    end

  end
end
