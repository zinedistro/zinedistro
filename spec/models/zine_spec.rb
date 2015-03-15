require 'rails_helper'
require_dependency 'zine'
require_dependency 'author'
require_dependency 'authorship'

describe Zine do
  describe 'validations' do
    context 'with all required attributes' do
      let(:zine) { FactoryGirl.build :zine }
      it 'is valid' do
        expect(zine).to be_valid
      end
    end

    context 'without a title' do
      let(:zine) { FactoryGirl.build :zine, title: nil }

      it 'is not valid' do
        expect(zine).to_not be_valid
        expect(zine.errors.count).to equal 1
        expect(zine.errors.full_messages.first).to eq(
          I18n.t('activerecord.attributes.zine.title') +
          ' ' +
          I18n.t('errors.messages.blank')
        )
      end
    end

    context 'without a cover image' do
      let(:zine) { FactoryGirl.build :zine, cover_image: nil }
      before { stub_legacy_zine_requests(zine) }

      it 'is not valid' do
        expect(zine).to_not be_valid
        expect(zine.errors.count).to equal 1
        expect(zine.errors.full_messages.first).to eq(
          I18n.t('activerecord.attributes.zine.cover_image') +
          ' ' +
          I18n.t('errors.messages.blank')
        )
      end

      context 'with a legacy_id' do
        let(:zine) { FactoryGirl.build :zine, cover_image: nil, legacy_id: 12 }
        before { stub_legacy_zine_requests(zine) }

        it 'is valid' do
          expect(zine).to be_valid
          expect(zine.remote_cover_image_url).to eq(
            "http://assets.zinedistro.org/zines/covers/#{zine.legacy_id}.png")
        end
      end
    end

    context 'without a PDF' do
      let(:zine) { FactoryGirl.build :zine, pdf: nil }

      it 'is not valid' do
        expect(zine).to_not be_valid
        expect(zine.errors.count).to equal 1
        expect(zine.errors.full_messages.first).to eq(
          I18n.t('activerecord.attributes.zine.pdf') +
          ' ' +
          I18n.t('errors.messages.blank')
        )
      end

      context 'with a legacy_id' do
        let(:zine) { FactoryGirl.build :zine, pdf: nil, legacy_id: 12 }
        before { stub_legacy_zine_requests(zine) }

        it 'is valid' do
          expect(zine).to be_valid
          expect(zine.remote_pdf_url).to eq(
            "http://assets.zinedistro.org/zines/pdfs/#{zine.legacy_id}.pdf")
        end
      end
    end
  end

  describe '.find_published' do
    context 'with a published zine' do
      let(:published_zine) { FactoryGirl.create :zine_with_authors }

      it 'returns the published zine' do
        expect(
          described_class.find_published(published_zine.id)
        ).to eq published_zine
      end
    end

    context 'with an unpublished zine' do
      let(:unpublished_zine) do
        FactoryGirl.build :zine_with_authors, :unpublished
      end

      it 'raises "record not found"' do
        expect do
          described_class.find_published(unpublished_zine.id)
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'without a zine' do
      it 'raises "record not found"' do
        expect do
          described_class.find_published('robots')
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '.catalog' do
    context 'with published a zine' do
      let(:published_zine) { FactoryGirl.create :zine_with_authors }
      let(:unpublished_zine) do
        FactoryGirl.build(:zine_with_authors, :unpublished)
      end

      it 'returns published zines' do
        expect(described_class.catalog).to include published_zine
      end

      it "doesn't return unpublished zines" do
        expect(described_class.catalog).not_to include unpublished_zine
      end
    end
  end

  describe '#add_author' do
    context 'with an author' do
      let(:author) { FactoryGirl.build :author }
      let(:zine) { FactoryGirl.create :zine }

      it 'adds an author as one of the zine authors' do
        expect(zine.authors).to eq []
        zine.add_author(author)
        expect(zine.authors).to eq [author]
      end

      it 'does not add the author multiple times' do
        expect(zine.author_count).to eq 0
        zine.add_author(author)
        expect do
          zine.add_author(author)
        end.to raise_error(ActiveRecord::RecordInvalid)
        expect(zine.author_count).to eq 1
      end
    end
  end

  describe '#remove_author' do
    context 'with an author' do
      let(:last_author) { published_zine.authors.last }
      let(:published_zine) { FactoryGirl.create :zine_with_authors }

      it 'removes the author as one of the zine authors' do
        expect(published_zine.remove_author(last_author)).to be_truthy
        expect(published_zine.author_count).to eq 2
      end
    end
  end

  describe '#author_count' do
    context 'with published zines' do
      let(:published_zine) { FactoryGirl.create :zine_with_authors }
      let(:zine) { FactoryGirl.create :zine }
      let(:author) { FactoryGirl.build :author }

      it 'returns the number of authors for a given zine' do
        expect(published_zine.author_count).to eq 3
      end

      context 'when adding an author' do
        it 'incriments author_count' do
          expect do
            zine.add_author(author)
          end.to change(zine.authors, :count).by(1)
        end
      end

      context 'when removing an author' do
        it 'decrements author_count' do
          zine.authors << author
          expect do
            zine.remove_author(author)
          end.to change(zine, :author_count).by(-1)
        end
      end
    end
  end

  describe '#publish!' do
    context 'with unpublished zines' do
      let(:zine) { FactoryGirl.build :zine, :unpublished }
      it 'changes the published attribute' do
        expect(zine.published).to be false
        expect do
          zine.publish!
        end.to change(zine, :published).from(false).to(true)
      end
    end
  end
end
