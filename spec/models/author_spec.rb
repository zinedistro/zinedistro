require 'rails_helper'
require_dependency 'author'

describe Author do
  describe 'find_published' do
    context 'with a publshed author' do
      let(:author) { FactoryGirl.create :author_with_zines }
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
  end
end
