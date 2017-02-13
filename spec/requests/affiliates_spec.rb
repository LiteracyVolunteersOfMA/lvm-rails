require 'rails_helper'

RSpec.describe "Affiliates", type: :request do
  describe "GET /affiliates" do
    it "works! (now write some real specs)" do
      get affiliates_path
      expect(response).to have_http_status(302)
    end
  end
end
