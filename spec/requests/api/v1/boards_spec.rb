require 'rails_helper'

RSpec.describe "Api::V1::Boards", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/boards/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/boards/show"
      expect(response).to have_http_status(:success)
    end
  end

end
