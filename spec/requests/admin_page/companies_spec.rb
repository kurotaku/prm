require 'rails_helper'

RSpec.describe "AdminPage::Companies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin_page/companies/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin_page/companies/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin_page/companies/show"
      expect(response).to have_http_status(:success)
    end
  end

end
