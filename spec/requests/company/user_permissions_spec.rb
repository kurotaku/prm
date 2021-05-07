# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Company::UserPermissions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/company/user_permissions/index"
      expect(response).to have_http_status(:success)
    end
  end
end
