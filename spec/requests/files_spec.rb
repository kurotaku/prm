require "rails_helper"

RSpec.describe "Files", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/files/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/files/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/files/show"
      expect(response).to have_http_status(:success)
    end
  end
end
