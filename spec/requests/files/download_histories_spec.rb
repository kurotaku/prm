require "rails_helper"

RSpec.describe "Files::DownloadHistories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/files/download_histories/index"
      expect(response).to have_http_status(:success)
    end
  end
end