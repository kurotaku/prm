require 'rails_helper'

RSpec.describe "MakerPage::Settings", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/maker_page/setting/show"
      expect(response).to have_http_status(:success)
    end
  end

end
