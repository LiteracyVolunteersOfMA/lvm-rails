require 'rails_helper'

RSpec.describe CoordinatorsController, type: :controller do
  describe 'endpoints' do
    before do
      sign_in_auth
    end

/    describe 'GET #index' do
      it 'populates an array of all coordinators' do
        coordinators = [create(:coordinator)]
        get :index
        expect(assigns(:coordinators)).to eq(coordinators)
      end

      it 'renders the :index view' do
        get :index

        expect(response).to render_template :index
      end
    end
/
    describe 'GET #show' do
      before do
        @coordinator = create(:coordinator)
      end

      it 'populates the specified coordinator' do
        get :show, id: @coordinator
        expect(assigns(:coordinator)).to eq(@coordinator)
      end
/
      it 'popultes a match' do
        match = Match.where(coordinator_id: @coordinator.id).take
        get :show, id: @coordinator
        expect(assigns(:match)).to eq(match)
      end
/
      it 'populates an enrollment' do
        enrollment = Enrollment.where(coordinator_id: @coordinator.id).take
        get :show, id: @coordinator
        expect(assigns(:enrollment)).to eq(enrollment)
      end

      it 'renders the :show view' do
        get :show, id: @coordinator
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it 'populates a new coordinator' do
        get :new
        expect(assigns(:coordinator)).to be_a_new(Coordinator)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      before do
        @coordinator = create(:coordinator)
      end

      it 'populates the specified coordinator' do
        get :edit, id: @coordinator
        expect(assigns(:coordinator)).to eq(@coordinator)
      end

      it 'renders the :edit view' do
        get :edit, id: @coordinator
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
      before do
        @coordinator_attrs = attributes_for(:coordinator)
      end

      context 'with valid attributes' do
        it 'saves the new coordinator in the database' do
          post :create, coordinator: @coordinator_attrs
          expect(assigns(:coordinator)).to be_persisted
        end

        it 'assigns the newly created coordinator as @coordinator' do
          post :create, coordinator: @coordinator_attrs
          expect(assigns(:coordinator)).to be_a(Coordinator)
        end

        it 'redirects to the newly created coordinator view' do
          post :create, coordinator: @coordinator_attrs
          expect(response).to redirect_to(Coordinator.last)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Coordinator).to receive(:save) { false }
        end

        it 'assigns a newly created but unsaved purchase as @purchase' do
          post :create, coordinator: @coordinator_attrs
          expect(assigns(:coordinator)).to be_a_new(Coordinator)
        end

        it 're-renders the :new view' do
          post :create, coordinator: @coordinator_attrs
          expect(response).to render_template :new
        end
      end
    end

    describe 'PUT #update' do
      before do
        @coordinator = create(:coordinator)
        @new_coordinator_attrs = attributes_for(:coordinator)
      end

      context 'with valid attributes' do
        it 'saves the new coordinator in the database' do
          post :update, id: @coordinator.id, coordinator: @new_coordinator_attrs
          expect(Coordinator.last.name).to eq(@new_coordinator_attrs[:name])
        end

        it 'assigns the updated coordinator as @coordinator' do
          post :update, id: @coordinator.id, coordinator: @new_coordinator_attrs
          expect(assigns(:coordinator).name).to eq(@new_coordinator_attrs[:name])
        end

        it 'redirects to the coordinator view' do
          post :update, id: @coordinator.id, coordinator: @new_coordinator_attrs
          expect(response).to redirect_to(@coordinator)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Coordinator).to receive(:update) { false }
        end

        it 'assigns the existing coordinator as @coordinator' do
          post :update, id: @coordinator, coordinator: @new_coordinator_attrs
          expect(assigns(:coordinator)).to eq(@coordinator)
        end

        it 're-renders the :edit view' do
          post :update, id: @coordinator, coordinator: @new_coordinator_attrs
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the coordinator' do
        coordinator = create(:coordinator)
        expect { delete :destroy, id: coordinator }
          .to change(Coordinator, :count).by(-1)
      end
      it 'redirects to the :index view' do
        coordinator = create(:coordinator)
        delete :destroy, id: coordinator
        expect(response).to redirect_to coordinators_path
      end
    end
/
    describe 'PUT #set_tutor' do
      context 'when tutor_id is zero' do
        before do
          @tutor_id = 0
        end

        it 'does not set up a new match for the coordinator' do
          coordinator = create(:coordinator)
          put :set_tutor, tutor_id: @tutor_id, coordinator_id: coordinator
          expect(Match.where(coordinator_id: coordinator, end: nil).length).to be(0)
        end

        context 'when coordinator has a tutor' do
          it 'unmatches the current tutor' do
            coordinator = create(:matched_coordinator)
            tutor_id = Match.where(coordinator_id: coordinator).take.tutor_id
            put :set_tutor, tutor_id: @tutor_id, coordinator_id: coordinator
            expect(
              Match.where(coordinator_id: coordinator, tutor_id: tutor_id).take.end
            ).not_to eq(nil)
          end
        end
      end

      context 'when tutor_id is nonzero' do
        before do
          @tutor = create(:tutor)
        end

        context 'when the coordinator does not have a tutor' do
          it 'matches the coordinator with the specified tutor' do
            coordinator = create(:coordinator)
            put :set_tutor, tutor_id: @tutor, coordinator_id: coordinator
            expect(
              Match.where(coordinator_id: coordinator, tutor_id: @tutor).length
            ).to eq(1)
          end
        end

        context 'when coordinator has a tutor' do
          before(:each) do
            @coordinator = create(:matched_coordinator)
            @old_tutor = Match.where(coordinator_id: @coordinator).take.tutor_id
          end

          context "when specified tutor is coordinator's current tutor" do
            before do
              @new_tutor = @old_tutor
            end

            it "does not unmatch the coordinator's current tutor" do
              put :set_tutor, tutor_id: @new_tutor, coordinator_id: @coordinator
              expect(
                Match.where(
                  coordinator_id: @coordinator, tutor_id: @old_tutor, end: nil
                ).length
              ).to eq(1)
            end

            it 'does not set up a new match for the coordinator' do
              put :set_tutor, tutor_id: @new_tutor, coordinator_id: @coordinator
              # That is, the coordinator started with and ended with exactlt 1 match
              expect(Match.where(coordinator_id: @coordinator).length).to eq(1)
            end
          end

          context "when specified tutor is not coordinator's current tutor" do
            before do
              @new_tutor = create(:tutor)
            end

            it "unmatches the coordinator's current tutor" do
              put :set_tutor, tutor_id: @new_tutor, coordinator_id: @coordinator
              expect(
                Match.where(
                  coordinator_id: @coordinator, tutor_id: @old_tutor, end: nil
                ).length
              ).to eq(0)
            end

            it 'matches the coordinator with the specified tutor' do
              put :set_tutor, tutor_id: @new_tutor, coordinator_id: @coordinator
              expect(
                Match.where(
                  coordinator_id: @coordinator, tutor_id: @new_tutor, end: nil
                ).length
              ).to eq(1)
            end
          end
        end
      end
    end /
  end
end
