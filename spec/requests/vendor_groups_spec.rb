require 'rails_helper'

RSpec.describe 'VendorGroups', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/vendor_groups/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/vendor_groups/show'
      expect(response).to have_http_status(:success)
    end
  end
end
