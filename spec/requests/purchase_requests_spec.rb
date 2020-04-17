require 'rails_helper'

RSpec.describe "Purchase flow", type: :request do

  let!(:seller_id) { create(:user).id.to_s }
  let!(:product_id) { create(:product, owner: seller_id).id.to_s }
  let!(:buyer_id) { create(:user).id.to_s }

  describe "post /buy" do
    context 'when there is an user and the product exists' do
      before { post "/buy/"+product_id, headers: authenticated_header_for_user_id(buyer_id) }

      it 'returns status code create' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when there is no user and the product exists' do
      before { post "/buy/:"+product_id }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when there is an user and the product doesnt exist' do
      before { post "/buy/:"+100.to_s, headers: authenticated_header_for_user_id(buyer_id) }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end
