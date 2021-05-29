# frozen_string_literal: true

require "rails_helper"

RSpec.describe "CompanyPage::Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/company_page/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/company_page/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/company_page/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/company_page/users/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
