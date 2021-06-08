require 'rails_helper'

RSpec.describe "Mypage::Profiles", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/mypage/profile/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
