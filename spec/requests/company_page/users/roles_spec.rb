# frozen_string_literal: true

require "rails_helper"

RSpec.describe "CompanyPage::Users::Roles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/company_page/users/roles/index"
      expect(response).to have_http_status(:success)
    end
  end
end
