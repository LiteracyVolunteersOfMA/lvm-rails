require 'rails_helper'

RSpec.describe AffiliateEventsController, type: :controller do
  describe 'endpoints' do
    before do
      sign_in_auth
    end

    describe 'GET #new' do
      before do
        @tutor = create(:tutor)
      end

      it 'populates a new affiliate event' do
        get :new, params: { tutor: @tutor }
        expect(assigns(:affiliate_event)).to be_a_new(AffiliateEvent)
      end

      it 'populates the correct tutor' do
        get :new, params: { tutor: @tutor }
        expect(assigns(:tutor)).to eq(@tutor)
      end

      it 'renders the new view' do
        get :new, params: { tutor: @tutor }
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      before do
        @tutor = create(:tutor)
        @affiliate_event = create(:affiliate_event, tutor_id: @tutor.id)
      end

      it 'populates the specified affiliate_event' do
        get :edit, params: { id: @affiliate_event, tutor: @tutor }
        expect(assigns(:affiliate_event)).to eq(@affiliate_event)
      end

      it 'populates the specified tutor' do
        get :edit, params: { id: @affiliate_event, tutor: @tutor }
        expect(assigns(:tutor)).to eq(@tutor)
      end

      it 'renders the edit view' do
        get :edit, params: { id: @affiliate_event, tutor: @tutor }
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
      before do
        @tutor = create(:tutor)
        @affiliate_event_attrs =
          attributes_for(:affiliate_event, tutor_id: @tutor.id)
      end

      context 'with valid attributes' do
        it 'saves the new affiliate_event in the database' do
          post :create, params: { affiliate_event: @affiliate_event_attrs }
          expect(assigns(:affiliate_event)).to be_persisted
        end

        it 'redirects to the existing tutor view' do
          post :create, params: { affiliate_event: @affiliate_event_attrs }
          expect(response).to redirect_to(@tutor)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(AffiliateEvent).to receive(:save) { false }
        end

        it 'assigns the specified tutor as @tutor' do
          post :create, params: { affiliate_event: @affiliate_event_attrs }
          expect(assigns(:tutor)).to eq(@tutor)
        end

        it 're-renders the :new view' do
          post :create, params: { affiliate_event: @affiliate_event_attrs }
          expect(response).to render_template :new
        end
      end
    end

    describe 'PUT #update' do
      before do
        @tutor = create(:tutor)
        @affiliate_event = create(:affiliate_event, tutor_id: @tutor.id)
        @new_affiliate_event_attrs =
          attributes_for(:affiliate_event, tutor_id: @tutor.id)
      end

      context 'with valid attributes' do
        it 'saves the updated affiliate_event in the database' do
          post :update, params: {
            id: @affiliate_event.id,
            affiliate_event: @new_affiliate_event_attrs
          }
          expect(AffiliateEvent.last.title)
            .to eq(@new_affiliate_event_attrs[:title])
        end

        it 'redirects to the existing tutor view' do
          post :update, params: {
            id: @affiliate_event.id,
            affiliate_event: @new_affiliate_event_attrs
          }
          expect(response).to redirect_to(@tutor)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(AffiliateEvent).to receive(:update) { false }
        end

        it "assigns the existing affiliate_event's tutor as @tutor" do
          post :update, params: {
            id: @affiliate_event.id,
            affiliate_event: @new_affiliate_event_attrs
          }
          expect(assigns(:tutor)).to eq(@tutor)
        end

        it 're-renders the :edit view' do
          post :update, params: {
            id: @affiliate_event.id,
            affiliate_event: @new_affiliate_event_attrs
          }
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the affiliate_event' do
        tutor = create(:tutor)
        affiliate_event = create(:affiliate_event, tutor_id: tutor.id)
        expect { delete :destroy, params: { id: affiliate_event } }
          .to change(AffiliateEvent, :count).by(-1)
      end

      it 'redirects to the :index view' do
        tutor = create(:tutor)
        affiliate_event = create(:affiliate_event, tutor_id: tutor.id)
        delete :destroy, params: { id: affiliate_event }
        expect(response).to redirect_to tutor_path(tutor)
      end
    end
  end
end
