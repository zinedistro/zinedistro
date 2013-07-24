require 'spec_helper'
describe Zine do

  let(:published_zine) { create :zine }
  let(:unpublished_zine) { create :unpublished_zine }

  describe ".find_published" do
    it "returns a published_zine when called with an id" do
      described_class.find_published(published_zine.id).should == published_zine
    end

    it "returns nil when the zine is not published" do
      described_class.find_published(unpublished_zine.id).should be_nil
    end
  end

  describe ".catalog" do
    it "returns published zines" do
      described_class.catalog.should include published_zine
    end

    it "doesn't return unpublished zines" do
      described_class.catalog.should_not include unpublished_zine
    end
  end

end
