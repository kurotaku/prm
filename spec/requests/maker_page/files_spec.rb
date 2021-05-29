# frozen_string_literal: true

require "rails_helper"

RSpec.describe "MakerPage::Files", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/files/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/maker_page/files/new"
      expect(response).to have_http_status(:success)
    end
  end
end
