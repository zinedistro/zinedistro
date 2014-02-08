require 'spec_helper'

describe ZineDecorator do
  let(:zine) { create :zine_with_authors }
  subject do
    # FIXME: stub out authors and ids to test in isolation
    # without creating database objects for each test
    described_class.new(zine)
  end
  describe '#link_to_cover_image_tag' do
    context 'with a cover image' do
      subject do
        described_class
                .new(build :zine, cover_url: 'http://flurp.com', id: 0)
      end
      it 'returns an image tag for the image' do
        subject.link_to_cover_image_tag
          .should eq "<a class=\"cover\" " \
          "href=\"/zines/0\">" \
          "<img alt=\"#{zine.title}\" " \
          "src=\"http://assets.zinedistro.org/zines/covers/0.png\" " \
          "/></a>"
      end
    end
  end

  describe '#path' do
    it 'returns a sanitized, seo-friendly url string' do
      subject.path
        .should eq '/zines/' \
        "#{zine.id}/" \
        "#{zine.title.downcase.gsub(' ', '-')}/" \
        "by/author-#{zine.authors[0].id}" \
        "-author-#{zine.authors[1].id}-" \
        "and-author-#{zine.authors[2].id}"
    end
  end

  describe '#author_names' do
    context 'with multiple authors' do
      it 'returns a concatenated string of authors' do
        expect(subject.author_names).to eq "#{zine.authors[0].name}, " \
          "#{zine.authors[1].name}, " \
          "and #{zine.authors[2].name}"
      end
    end

    context 'whithout an author' do
      let(:zine) { build :zine }
      it "returns 'anonymous'" do
        expect(subject.author_names).to eq 'Anonymous'
      end
    end
  end

end
