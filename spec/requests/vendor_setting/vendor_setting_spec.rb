require "rails_helper"

RSpec.describe "VendorSetting::VendorSettings", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/vendor_setting/vendor_setting/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/vendor_setting/vendor_setting/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
