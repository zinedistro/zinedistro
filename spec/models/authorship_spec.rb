require 'spec_helper'
describe Authorship do
  context 'relationships' do
    it 'belongs_to a zine' do
      reflection = described_class.reflect_on_association(:zine)
      reflection.macro.should eq :belongs_to
    end
    it 'belongs_to an author' do
      reflection = described_class.reflect_on_association(:author)
      reflection.macro.should eq :belongs_to
    end
  end
end
