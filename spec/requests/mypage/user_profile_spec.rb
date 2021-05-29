# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Mypage::UserProfiles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/mypage/user_profile/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/mypage/user_profile/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/mypage/user_profile/update"
      expect(response).to have_http_status(:success)
    end
  end
end
