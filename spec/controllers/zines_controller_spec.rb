require 'spec_helper'

describe ZinesController do

  context 'parameters' do

    context 'index' do
      it 'permits a page' do
        params = ActionController::Parameters.new(page: 1)
        zine_params = ZinesController::ZineParams.index(params)
        expect(zine_params).to eq('page' => 1)
      end
    end

    context 'show' do
      it 'requires an id' do
        params = ActionController::Parameters.new(id: 1)
        ZinesController::ZineParams.show(params)
        expect(params).to eq('id' => 1)
      end
    end
  end

  describe 'on GET to :show' do
    context 'with one zine' do
      let(:zine) { create :zine_with_authors }

      context 'with valid params' do
        before do
          get :show, id: zine.id
        end

        it { is_expected.to respond_with 200 }

        it 'assigns zine as @zine' do
          expect(assigns(:zine)).to eq zine
        end

        it 'is decorated with ZineDecorator' do
          expect(assigns(:zine)).to be_decorated_with ZineDecorator
        end

      end
    end
  end

  describe 'on GET to :index' do
    let(:author_with_zines) { create :author, :with_zines }

    context 'with valid params' do

      before do
        get :index
      end

      it { is_expected.to respond_with 200 }

      it 'assigns the entire published zine catalog as @zines' do
        expect(assigns(:zines)).to eq Zine.catalog
      end

    end
  end
end
