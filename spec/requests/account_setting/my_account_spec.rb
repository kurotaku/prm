require 'rails_helper'

RSpec.describe "AccountSetting::MyAccounts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/account_setting/my_account/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/account_setting/my_account/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
