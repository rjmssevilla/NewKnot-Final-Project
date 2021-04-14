require 'rails_helper'

RSpec.describe 'Buyers', type: :request do
  let(:buyer) { create(:buyer) }
  let(:service) { create(:service) }

  before do
    sign_in(buyer)
  end

  describe 'GET /show' do
    it 'works! buyer show path reached' do
      get buyer_path(buyer)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /filter' do
    it 'works! category filter path reached' do
      get category_filter_path(category: service.category)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /profile' do
    it 'works! buyer profile path reached' do
      get buyers_profile_path(buyer)
      expect(response).to have_http_status(:ok)
    end
  end
end
