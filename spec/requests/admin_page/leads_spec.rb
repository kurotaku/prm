require "rails_helper"

RSpec.describe "AdminPage::Leads", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin_page/leads/index"
      expect(response).to have_http_status(:success)
    end
  end
end
