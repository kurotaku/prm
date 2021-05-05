require 'rails_helper'

RSpec.describe 'VendorInformations', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/vendor_informations/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/vendor_informations/show'
      expect(response).to have_http_status(:success)
    end
  end
end
