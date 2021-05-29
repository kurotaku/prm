# frozen_string_literal: true

require "rails_helper"

RSpec.describe "CompanyPage::Companies", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/company_page/company/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/company_page/company/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
