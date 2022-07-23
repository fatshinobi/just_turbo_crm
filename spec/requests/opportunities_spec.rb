require 'rails_helper'

RSpec.describe "Opportunities", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/opportunities/index"
      expect(response).to have_http_status(:success)
    end
  end

end
