require 'rails_helper'

RSpec.describe 'BuyerServices', type: :request do
  let(:buyer) { create(:buyer) }
  let(:service) { create(:service) }
  let(:buyer_service) { create(:buyer_service) }

  before do
    sign_in(buyer)
  end

  describe 'POST /buyer_services#create' do
    it 'works! service created!' do
      post buyer_service_path(service)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE /buyer_services#destroy' do
    it 'works! service deleted!' do
      delete delete_buyer_service_path(id: buyer_service.id)
      expect(response).to have_http_status(:redirect)
    end
  end
end
