require 'rails_helper'

RSpec.describe "CompanyProfiles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/company_profiles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/company_profiles/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
