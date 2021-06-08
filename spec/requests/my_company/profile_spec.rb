require 'rails_helper'

RSpec.describe "MyCompany::Profiles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/my_company/profile/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/my_company/profile/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
