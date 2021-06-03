require "rails_helper"

RSpec.describe "VendorSetting::LeadColumns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/vendor_setting/lead_columns/index"
      expect(response).to have_http_status(:success)
    end
  end
end
