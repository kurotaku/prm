# frozen_string_literal: true

require "rails_helper"

RSpec.describe "VendorPage::Partners", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/vendor_page/partners/index"
      expect(response).to have_http_status(:success)
    end
  end
end
