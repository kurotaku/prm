require 'rails_helper'

RSpec.describe "MakerPage::Products", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/products/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/maker_page/products/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/maker_page/products/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
