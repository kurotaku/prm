# frozen_string_literal: true

require "rails_helper"

RSpec.describe "MakerPage::DownloadHistories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/download_histories/index"
      expect(response).to have_http_status(:success)
    end
  end
end
