require 'rails_helper'

RSpec.describe AffiliatesController, type: :controller do
  describe 'endpoints' do
    before do
      sign_in_auth
    end

    describe 'GET #index' do
      it 'populates an array of all affiliate' do
        affiliates = [create(:affiliate)]
        get :index
        expect(assigns(:affiliates)).to eq(affiliates)
      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      before do
        @affiliate = create(:affiliate)
      end

      it 'populates the specified affiliate' do
        get :show, params: { id: @affiliate }
        expect(assigns(:affiliate)).to eq(@affiliate)
      end

      it 'renders the :show view' do
        get :show, params: { id: @affiliate}
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it 'populates a new affiliate' do
        get :new
        expect(assigns(:affiliate)).to be_a_new(Affiliate)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      before do
        @affiliate = create(:affiliate)
      end
      it 'populates the specific student' do
        get :edit, params: { id: @affiliate }
        expect(assigns(:affiliate)).to eq(@affiliate)
      end

      it 'render the :edit view' do
        get :edit, params: { id: @affiliate }
        expect(response).to render_template :new
      end
    end





    describe "POST #create" do
      context "with valid params" do
        it "creates a new Affiliate" do
          expect {
            post :create, params: {affiliate: valid_attributes}, session: valid_session
          }.to change(Affiliate, :count).by(1)
        end

        it "assigns a newly created affiliate as @affiliate" do
          post :create, params: {affiliate: valid_attributes}, session: valid_session
          expect(assigns(:affiliate)).to be_a(Affiliate)
          expect(assigns(:affiliate)).to be_persisted
        end

        it "redirects to the created affiliate" do
          post :create, params: {affiliate: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Affiliate.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved affiliate as @affiliate" do
          post :create, params: {affiliate: invalid_attributes}, session: valid_session
          expect(assigns(:affiliate)).to be_a_new(Affiliate)
        end

        it "re-renders the 'new' template" do
          post :create, params: {affiliate: invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested affiliate" do
          affiliate = Affiliate.create! valid_attributes
          put :update, params: {id: affiliate.to_param, affiliate: new_attributes}, session: valid_session
          affiliate.reload
          skip("Add assertions for updated state")
        end

        it "assigns the requested affiliate as @affiliate" do
          affiliate = Affiliate.create! valid_attributes
          put :update, params: {id: affiliate.to_param, affiliate: valid_attributes}, session: valid_session
          expect(assigns(:affiliate)).to eq(affiliate)
        end

        it "redirects to the affiliate" do
          affiliate = Affiliate.create! valid_attributes
          put :update, params: {id: affiliate.to_param, affiliate: valid_attributes}, session: valid_session
          expect(response).to redirect_to(affiliate)
        end
      end

      context "with invalid params" do
        it "assigns the affiliate as @affiliate" do
          affiliate = Affiliate.create! valid_attributes
          put :update, params: {id: affiliate.to_param, affiliate: invalid_attributes}, session: valid_session
          expect(assigns(:affiliate)).to eq(affiliate)
        end

        it "re-renders the 'edit' template" do
          affiliate = Affiliate.create! valid_attributes
          put :update, params: {id: affiliate.to_param, affiliate: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested affiliate" do
        affiliate = Affiliate.create! valid_attributes
        expect {
          delete :destroy, params: {id: affiliate.to_param}, session: valid_session
        }.to change(Affiliate, :count).by(-1)
      end

      it "redirects to the affiliates list" do
        affiliate = Affiliate.create! valid_attributes
        delete :destroy, params: {id: affiliate.to_param}, session: valid_session
        expect(response).to redirect_to(affiliates_url)
      end
    end

  end
end

