require 'rails_helper'
require_dependency 'authorship'

describe Authorship do
  let(:author) { FactoryBot.build :author }
  let(:zine) { FactoryBot.build :zine }

  context 'validations' do
    it { is_expected.to validate_presence_of :zine_id }
    it { is_expected.to validate_presence_of :author_id }
    it { is_expected.to validate_numericality_of :author_id }

    it 'raises an exception when adding duplicate authorship' do
      expect do
        zine.add_author(author)
        zine.add_author(author)
      end
      .to raise_error ActiveRecord::RecordInvalid
    end
  end

  context 'relationships' do
    it { is_expected.to belong_to(:author).dependent(:destroy) }
    it { is_expected.to belong_to :zine }
  end
end
