require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  define 'POST #create' do
    it 'creates a new match' do
      @match_attrs = build(:match)
      post :create, @match_attrs
      expect(assigns(:match)).to be_persisted
    end
  end
end
