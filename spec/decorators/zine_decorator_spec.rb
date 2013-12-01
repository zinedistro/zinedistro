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
        described_class.new(build :zine, :with_3_authors, cover_url: nil)
      end
      it 'returns the default image' do
        subject.link_to_cover_image_tag
        .should eq '<img alt="Missing zine cover" ' +
        'src="http://assets.zinedistro.org/zines/covers/missing.png" />'
      end
    end
  end

  describe '#path' do
    subject do
      described_class.new(create :zine, :with_3_authors)
    end

    it 'returns a sanitized, seo-friendly url string' do
      subject.path
        .should eq '/zines/' +
        "#{subject.object.id}/" +
        "#{subject.object.title.downcase.gsub(' ', '-')}/" +
        "by/author-#{subject.object.authors[0].id}" +
        "-author-#{subject.object.authors[1].id}-" +
        "and-author-#{subject.object.authors[2].id}"
    end
  end

  describe '#author_names' do
    subject do
      described_class.new(zine)
    end

    context 'with multiple authors' do
      let(:zine) { create :zine, :with_3_authors }
      it 'returns a concatenated string of authors' do
        expect(subject.author_names).to eq "#{zine.authors[0].name}, " +
          "#{zine.authors[1].name}, " +
          "and #{zine.authors[2].name}"
      end
    end

    context 'whithout an author' do
      let(:zine) { create :zine, :with_no_authors }
      it "returns 'anonymous'" do
        expect(subject.author_names).to eq 'Anonymous'
      end
    end
  end

end
