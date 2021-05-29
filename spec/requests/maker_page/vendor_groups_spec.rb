# frozen_string_literal: true

require "rails_helper"

RSpec.describe "MakerPage::VendorGroups", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/vendor_groups/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/maker_page/vendor_groups/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/maker_page/vendor_groups/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/maker_page/vendor_groups/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
