require 'rails_helper'

RSpec.describe "MakerPage::LeadRaws", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/lead_raw/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/maker_page/lead_raw/new"
      expect(response).to have_http_status(:success)
    end
  end

end
