require "rails_helper"

describe AuthorsController do
  describe 'on GET to :index' do
    context 'with published authors' do
      let!(:author) { FactoryGirl.create :author_with_zines }

      before do
        get :index
      end

      it { is_expected.to respond_with 200 }

      it 'assigns authors as @authors' do
        expect(assigns(:authors)).to eq [author]
      end
    end
  end

  describe 'on GET to :show' do
    context 'with a published author' do
      let(:author) { FactoryGirl.create :author_with_zines }

      before do
        author.zines.first.publish!
        get :show, id: author
      end

      it { is_expected.to respond_with 200 }

      it 'assigns the published author as @author' do
        expect(assigns(:author)).to eq author
      end
    end

    context 'with an unpublished author' do
      let(:author) { FactoryGirl.create :author_with_zines, zines_count: 1 }

      before do
        author.zines.first.update!(published: false)
        get :show, id: author
      end

      it { is_expected.to respond_with 404 }

      it 'sets the flash message' do
        expect(flash[:notice]).not_to be_nil
      end
    end

    context 'without an author' do
      before do
        get :show, id: 0
      end

      it { is_expected.to respond_with 404 }

      it 'sets the flash message' do
        expect(flash[:notice]).to eq I18n.t('flash.record_not_found')
      end

      it 'renders the missing template' do
        expect(response).to render_template 'application/_missing'
      end
    end
  end
end
