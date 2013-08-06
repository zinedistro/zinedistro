describe ZinesController do

  context "parameters" do

    it "requires an id" do
      params = ActionController::Parameters.new({ id: 'foo', name: 'baz' })
      zine_params = ZinesController::ZineParams.build(params)
      expect(zine_params).to eq('foo')
    end

  end

  describe "#show" do

    context "with one zine" do
      let(:zine) { create :zine }

      context "with valid params" do
        before do
          get :show, id: zine.id
        end

        it "returns successfully" do
          response.should be_success
        end

        it "assigns zine as :zine" do
          assigns(:zine).should eq zine
        end

      end
    end
  end
end
