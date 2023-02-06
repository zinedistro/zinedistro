require 'rails_helper'
require_dependency 'author'
include ActiveSupport::Testing::TimeHelpers

describe Author do
  describe 'find_published' do
    context 'with a publshed author' do
      let(:author) { FactoryBot.create :author_with_zines }

      before do
        author.zines.last.publish!
      end

      it 'returns the published author' do
        expect(described_class.find_published(author.id)).to eq(author)
      end
    end

    context 'without an author' do
      let(:not_found) { ActiveRecord::RecordNotFound }

      it 'raises not_found' do
        expect {
          described_class.find_published(0)
        }.to raise_error not_found
      end
    end

    describe '#most_recent' do
      let(:author) { FactoryBot.create :author_with_zines }

      before do
        travel_to Time.zone.local(2004, 11, 24, 01, 04, 44)
        author
      end

      after do
        travel_back
      end

      it 'returns a time with zone object' do
        expect(Author.most_recently_updated_at.class.to_s).to(
          eq 'ActiveSupport::TimeWithZone'
        )

        expect(Author.most_recently_updated_at.to_s).to(
          eq('2004-11-24 01:04:44 -0800')
        )
      end
    end
  end
end
