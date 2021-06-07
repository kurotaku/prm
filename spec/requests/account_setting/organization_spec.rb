require 'rails_helper'

RSpec.describe "AccountSetting::Organizations", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/account_setting/organization/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
