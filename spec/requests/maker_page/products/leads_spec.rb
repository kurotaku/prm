# frozen_string_literal: true

require "rails_helper"

RSpec.describe "MakerPage::Products::Leads", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/products/leads/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/maker_page/products/leads/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/maker_page/products/leads/new"
      expect(response).to have_http_status(:success)
    end
  end
end
