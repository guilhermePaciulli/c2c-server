require 'rails_helper'

RSpec.describe "Purchase flow", type: :request do

  let!(:seller_id) { create(:user).id.to_s }
  let!(:product_id) { create(:product, owner: seller_id).id.to_s }
  let!(:buyer_id) { create(:user).id.to_s }

  describe "post /buy" do
    context 'when there is an user and the product exists' do
      before { post "/buy/"+product_id, headers: authenticated_header_for_user_id(buyer_id) }

      it 'returns status code created' do
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

  let!(:another_product_id)  { create(:product, owner: seller_id).id.to_s }
  let!(:purchase) { create(:purchase, user_id: buyer_id, product_id: another_product_id) }

  describe "get /purchases" do
    context "when the there is an user" do
      before { get "/purchases", headers: authenticated_header_for_user_id(buyer_id) }

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns a valid json" do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end
    end
    context "when the there is no user" do
      before { get "/purchases" }

      it "returns status code 401" do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "get /purchases/:id" do
    context "when the there is an user" do
      before { get "/purchases/"+purchase.id.to_s, headers: authenticated_header_for_user_id(buyer_id) }

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns a valid json" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(purchase.id)
      end
    end
    context "when the there is no user" do
      before { get "/purchases/"+purchase.id.to_s }

      it "returns status code 401" do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "get /sells" do
    context "when the there is an user" do
      before { get "/sells", headers: authenticated_header_for_user_id(seller_id) }

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns a valid json" do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end
    end
    context "when the there is no user" do
      before { get "/sells" }

      it "returns status code 401" do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "patch /sells" do
    context "when the there is an user and the status is valid" do
      before { patch "/sells/"+purchase.id.to_s,
        headers: authenticated_header_for_user_id(seller_id) }

      it "returns a valid json" do
        expect(json).not_to be_empty
        expect(json["purchase_status"]).to eq("confirmed")
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
    context "when the there is an user and the status is invalid" do
      before { patch "/sells/"+purchase.id.to_s,
        headers: authenticated_header_for_user_id(buyer_id) }

      it "returns status code 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
