# frozen_string_literal: true

require "rails_helper"

RSpec.describe "AdminPage::Organizations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin_page/Organizations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin_page/Organizations/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin_page/Organizations/show"
      expect(response).to have_http_status(:success)
    end
  end
end
