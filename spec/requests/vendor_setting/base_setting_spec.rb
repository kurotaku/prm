require "rails_helper"

RSpec.describe "VendorSetting::BaseSettings", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/vendor_setting/base_setting/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
