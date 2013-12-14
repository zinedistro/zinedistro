require 'spec_helper'
describe AuthorsController do
  describe '#index' do
    context 'with published authors' do
      let!(:author) { create :author_with_zines }

      before do
        get :index
      end

      it 'returns 200' do
        response.status.should eq 200
      end

      it 'assigns authors as :authors' do
        assigns(:authors).should eq [author]
      end
    end
  end

  describe '#zines' do
    context 'with a published author' do
      let!(:author) { create :author_with_zines }

      before do
        get :zines, id: author
      end

      it 'returns 200' do
        response.status.should eq 200
      end

      it 'assigns the published author as author' do
        assigns(:author).should eq author
      end
    end

    context 'without an author' do
      before do
        get :zines, id: 0
      end

      it 'returns 404' do
        response.status.should eq 404
      end

      it 'sets the flash message' do
        flash[:notice].should_not be_nil
      end
    end
  end
end
