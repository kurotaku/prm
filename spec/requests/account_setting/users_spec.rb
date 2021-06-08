require 'rails_helper'

RSpec.describe "AccountSetting::Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/account_setting/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/account_setting/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/account_setting/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/account_setting/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
