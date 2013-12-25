require 'spec_helper'
describe Authorship do
  let(:author) { build :author }
  let(:zine) { build :zine }

  context 'validations' do
    it { should validate_presence_of :zine_id }
    it { should validate_presence_of :author_id }

    it 'raises an exception when adding duplicate authorship' do
      expect do
        zine.add_author(author)
        zine.add_author(author)
      end
      .to raise_error ActiveRecord::RecordInvalid
    end
  end

  context 'relationships' do
    it { should belong_to(:author).dependent(:destroy) }
    it { should belong_to :zine }
  end
end
