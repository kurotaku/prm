# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Company::Profiles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/company/profiles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/company/profiles/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
