require 'rails_helper'

RSpec.describe "MakerPage::Products::LeadRawLabels", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/products/lead_raw_labels/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/maker_page/products/lead_raw_labels/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/maker_page/products/lead_raw_labels/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/maker_page/products/lead_raw_labels/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
