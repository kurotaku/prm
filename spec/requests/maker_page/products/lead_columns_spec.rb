require 'rails_helper'

RSpec.describe "MakerPage::Products::LeadColumns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/products/lead_columns/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/maker_page/products/lead_columns/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
