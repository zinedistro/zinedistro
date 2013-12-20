require 'spec_helper'
describe Zine do

  let(:published_zine) { create :zine_with_authors }
  let(:unpublished_zine) { create :zine_with_authors, :unpublished }
  let(:zine) { create :zine }
  let(:author) { create :author }

  describe '.find_published' do
    it 'returns a published_zine when called with an id' do
      expect(
        described_class.find_published(published_zine.id)
      ).to eq published_zine
    end

    it 'returns nil when the zine is not published' do
      expect(
        described_class.find_published(unpublished_zine.id)
      ).to be_nil
    end
  end

  describe '.catalog' do
    it 'returns published zines' do
      described_class.catalog.should include published_zine
    end

    it "doesn't return unpublished zines" do
      described_class.catalog.should_not include unpublished_zine
    end
  end

  describe '#add_author' do
    it 'adds an author as one of the zine authors' do
      expect(zine.authors).to eq []
      zine.add_author(author)
      expect(zine.reload.authors).to eq [author]
    end
  end

  describe '#remove_author' do
    it 'removes the author as one of the zine authors' do
      published_zine.add_author(author)
      expect { published_zine.remove_author(author) }.to change {
        published_zine.authors.count
      }.from(4).to(3)
    end
  end

  describe '#author_count' do
    it 'returns the number of authors for a given zine' do
      published_zine.author_count.should eq 4
    end
  end

end
