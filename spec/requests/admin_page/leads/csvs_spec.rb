require "rails_helper"

RSpec.describe "AdminPage::Leads::Csvs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin_page/leads/csvs/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin_page/leads/csvs/new"
      expect(response).to have_http_status(:success)
    end
  end
end
