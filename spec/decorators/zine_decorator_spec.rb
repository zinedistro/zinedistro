require 'rails_helper'

describe ZineDecorator do
  let(:zine) { FactoryGirl.create :zine_with_authors }

  subject do
    # FIXME: stub out authors and ids to test in isolation
    # without creating database objects for each test
    described_class.new(zine)
  end

  describe '#id' do
    subject do
      described_class.new(build :zine, id: 1234)
    end
    it 'returns the zine id' do
      expect(subject.id).to match 1234
    end
  end

  describe '#full_title' do
    it 'returns a concatenated string of title and subtitle' do
      expect(subject.full_title).to eq zine.title + ': ' + zine.subtitle
    end
  end

  describe '#cover_image_tag' do
    context 'with a cover image' do
      subject do
        described_class.new(build :zine, id: 0)
      end

      it 'returns the cover image' do
        allow(zine).to receive(:title)
        expect(subject.cover_image_tag).to(
          match "#{subject.cover_image.list_view.url}"
        )
        expect(subject.cover_image_tag).to(
          match "#{subject.title}"
        )
      end
    end
  end

  describe '#path' do
    it 'returns a sanitized, seo-friendly url string' do
      expect(subject.path).to(
        eq '/zines/' \
        "#{zine.id}/" \
        "#{zine.title.downcase.gsub(' ', '-')}/" \
        "by/author-#{zine.authors[0].id}" \
        "-author-#{zine.authors[1].id}-" \
        "and-author-#{zine.authors[2].id}"
      )
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
      let(:zine) { FactoryGirl.build :zine }
      it "returns 'anonymous'" do
        expect(subject.author_names).to eq 'Anonymous'
      end
    end
  end
end
