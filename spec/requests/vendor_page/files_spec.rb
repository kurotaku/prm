# frozen_string_literal: true

require "rails_helper"

RSpec.describe "VendorPage::Files", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/vendor_page/files/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/vendor_page/files/new"
      expect(response).to have_http_status(:success)
    end
  end
end
