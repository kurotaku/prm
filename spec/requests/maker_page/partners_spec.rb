require 'rails_helper'

RSpec.describe "MakerPage::Partners", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maker_page/partners/index"
      expect(response).to have_http_status(:success)
    end
  end

end
