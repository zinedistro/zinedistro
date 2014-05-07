require 'spec_helper'

describe AuthorsController do
  describe 'on GET to :index' do
    context 'with published authors' do
      let!(:author) { create :author_with_zines }

      before do
        get :index
      end

      it { should respond_with 200 }

      it 'assigns authors as @authors' do
        assigns(:authors).should eq [author]
      end
    end
  end

  describe 'on GET to :show' do
    context 'with a published author' do
      let(:author) { create :author_with_zines }

      before do
        author.zines.first.publish!
        get :show, id: author
      end

      it { should respond_with 200 }

      it 'assigns the published author as @author' do
        assigns(:author).should eq author
      end
    end

    context 'with an unpublished author' do
      let(:author) { create :author_with_zines, zines_count: 1 }

      before do
        author.zines.first.update_attributes(published: false)
        get :show, id: author
      end

      it { should respond_with 404 }

      it 'sets the flash message' do
        flash[:notice].should_not be_nil
      end
    end

    context 'without an author' do
      before do
        get :show, id: 0
      end

      it { should respond_with 404 }

      it 'sets the flash message' do
        flash[:notice].should eq I18n.t('flash.record_not_found')
      end

      it 'renders the missing template' do
        response.should render_template 'application/_missing'
      end
    end
  end
end
