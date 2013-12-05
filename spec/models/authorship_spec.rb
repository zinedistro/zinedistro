require 'spec_helper'
describe Authorship do
  context 'validations' do
    it { should validate_presence_of :zine_id }
    it { should validate_presence_of :author_id }
  end

  context 'relationships' do
    it { should belong_to(:author).dependent(:destroy) }
    it { should belong_to :zine }
  end
end
