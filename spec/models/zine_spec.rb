require 'spec_helper'

describe Zine do

  describe 'validations' do
    context 'without a cover image' do
      let(:zine) { build :zine, cover_image: nil }

      it 'is not valid' do
        expect(zine).to_not be_valid
        expect(zine.errors.count).to equal 1
        expect(zine.errors.full_messages.first).to eq(
          "#{I18n.t('zines.cover_image')} #{I18n.t('errors.messages.blank')}"
        )
      end
    end
  end

  describe '.find_published' do
    context 'with a published zine' do
      let(:published_zine) { create :zine_with_authors }

      it 'returns the published zine' do
        described_class.find_published(published_zine.id)
        .should eq published_zine
      end
    end

    context 'with an unpublished zine' do
      let(:unpublished_zine) { build :zine_with_authors, :unpublished }

      it 'raises "record not found"' do
        expect {
          described_class.find_published(unpublished_zine.id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'without a zine' do

      it 'raises "record not found"' do
        expect {
          described_class.find_published('robots')
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '.catalog' do
    context 'with published a zine' do
      let(:published_zine) { create :zine_with_authors }
      let(:unpublished_zine) { build :zine_with_authors, :unpublished }

      it 'returns published zines' do
        described_class.catalog.should include published_zine
      end

      it "doesn't return unpublished zines" do
        described_class.catalog.should_not include unpublished_zine
      end
    end
  end

  describe '#add_author' do
    context "with an author" do
      let(:author) { build :author }
      let(:zine) { create :zine }

      it 'adds an author as one of the zine authors' do
        expect(zine.authors).to eq []
        zine.add_author(author)
        expect(zine.authors).to eq [author]
      end

      it 'does not add the author multiple times' do
        zine.author_count.should eq 0
        zine.add_author(author)
        expect {
          zine.add_author(author)
        }.to raise_error(ActiveRecord::RecordInvalid)
        zine.author_count.should eq 1
      end
    end
  end

  describe '#remove_author' do
    context 'with an author' do
      let(:last_author) { published_zine.authors.last }
      let(:published_zine) { create :zine_with_authors }

      it 'removes the author as one of the zine authors' do
        expect(published_zine.remove_author(last_author)).to be_truthy
        expect(published_zine.author_count).to eq 2
      end
    end
  end

  describe '#author_count' do
    context 'with published zines' do
      let(:published_zine) { create :zine_with_authors }
      let(:zine) { create :zine }
      let(:author) { build :author }

      it 'returns the number of authors for a given zine' do
        published_zine.author_count.should eq 3
      end

      context 'when adding an author' do
        it 'incriments author_count' do
          expect {
            zine.add_author(author)
          }.to change(zine.authors, :count).by(1)
        end
      end

      context 'when removing an author' do
        it 'decrements author_count' do
          zine.authors << author
          expect {
            zine.remove_author(author)
          }.to change(zine, :author_count).by(-1)
        end
      end
    end
  end

  describe '#publish!' do
    context 'with unpublished zines' do
      let(:zine) { build :zine, :unpublished }
      it 'changes the published attribute' do
        zine.published.should be false
        expect {
          zine.publish!
        }.to change(zine, :published).from(false).to(true)
      end
    end
  end

end
