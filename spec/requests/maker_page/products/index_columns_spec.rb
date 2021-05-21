require 'rails_helper'

RSpec.describe "MakerPage::Products::IndexColumns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/products/index_columns/index"
      expect(response).to have_http_status(:success)
    end
  end

end
