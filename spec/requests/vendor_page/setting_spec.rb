# frozen_string_literal: true

require "rails_helper"

RSpec.describe "VendorPage::Settings", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/vendor_page/setting/show"
      expect(response).to have_http_status(:success)
    end
  end
end
