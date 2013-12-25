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

    it 'does not add the author multiple times' do
      pending 'Database uniqueness & validation'
      zine.author_count.should eq 0
      zine.add_author(author)
      zine.add_author(author)
      zine.reload.author_count.should eq 1
    end
  end

  describe '#remove_author' do
    context 'with an author' do
      it 'removes the author as one of the zine authors' do
        author = published_zine.authors.last
        published_zine.remove_author(author).should be_truthy
        published_zine.reload.author_count.should eq 2
      end
    end
    context 'with an array of authors' do
      it 'removes each author as one of the zine authors' do
        authors = published_zine.authors.slice(0, 2)
        published_zine.remove_author(authors).should be_truthy
        published_zine.reload.author_count.should eq 1
      end
    end
  end

  describe '#author_count' do
    context 'with authors' do
      it 'returns the number of authors for a given zine' do
        published_zine.reload.author_count.should eq 3
      end
    end

    context 'with no authors' do
      it 'returns 0' do
        zine.reload.author_count.should eq 0
      end
    end

    context 'when adding an author' do
      it 'incriments author_count' do
        expect do
          zine.add_author(author)
        end
        .to change(zine.reload.authors, :count).by(1)
      end
    end

    context 'when removing an author' do
      it 'decrements author_count' do
        zine.authors << author
        expect do
          zine.remove_author(author)
        end
        .to change(zine.reload, :author_count).by(-1)
      end
    end
  end

end
