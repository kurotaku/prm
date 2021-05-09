require 'rails_helper'

RSpec.describe "CompanyPage::UserProfiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/company_page/user_profiles/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/company_page/user_profiles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/company_page/user_profiles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/company_page/user_profiles/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/company_page/user_profiles/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/company_page/user_profiles/update"
      expect(response).to have_http_status(:success)
    end
  end

end
