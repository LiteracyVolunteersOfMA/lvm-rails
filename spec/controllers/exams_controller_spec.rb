require 'rails_helper'

RSpec.describe ExamsController, type: :controller do
  describe 'endpoints' do
    before do
      sign_in_auth
    end

    describe 'GET #index' do
      before do
        @exam = create(:exam)
      end

      it 'populates an array of exams' do
        # exams = [create(:exams)]
        get :index
        expect(assigns(:exams)).to eq([@exam])
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET #show' do
      before do
        @exam = create(:exam)
      end
    end

  end
end
