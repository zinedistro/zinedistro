require 'spec_helper'
describe Author do
  describe 'find_published' do
    context 'with a publshed author' do
      let(:author) { create :author_with_zines }
      before do
        author.zines.last.publish!
      end
      it 'returns the published author' do
        described_class.find_published(author.id).should == author
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