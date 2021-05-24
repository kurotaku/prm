require 'rails_helper'

RSpec.describe "MakerPage::Products::LeadCategories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/products/lead_categories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/maker_page/products/lead_categories/show"
      expect(response).to have_http_status(:success)
    end
  end

end
