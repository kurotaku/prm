require 'rails_helper'

RSpec.describe "MyCompany::Staffs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/my_company/staffs/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/my_company/staffs/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/my_company/staffs/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
