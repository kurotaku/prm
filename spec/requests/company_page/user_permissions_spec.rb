require 'rails_helper'

RSpec.describe "CompanyPage::UserPermissions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/company_page/user_permissions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
