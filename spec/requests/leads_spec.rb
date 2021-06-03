require "rails_helper"

RSpec.describe "Leads", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/leads/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/leads/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/leads/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/leads/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
