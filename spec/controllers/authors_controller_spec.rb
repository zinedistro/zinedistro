require 'spec_helper'
describe AuthorsController do
  describe "index" do
    context "with published authors" do
      let!(:zine) { create :zine }

      before do
        get :index
      end

      it "returns 200" do
        response.status.should eq 200
      end

      it "assigns authors as :author" do
        assigns(:authors).should eq zine.authors
      end
    end
  end
  describe "zines" do
    context "with a published author" do
      let!(:zine) { create :zine }

      before do
        get :zines, id: zine.authors.first
      end

      it "returns 200" do
        response.status.should eq 200
      end

      it "assigns the published author as author" do
        assigns(:author).should eq zine.authors.first
      end
    end
    context "without an author" do
      before do
        get :zines, id: 0
      end

      it "returns 404" do
        response.status.should eq 404
      end

      it "sets the flash message" do
        flash[:notice].should_not be_nil
      end
    end
  end
end
