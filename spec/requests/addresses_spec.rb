require 'rails_helper'

RSpec.describe "Addresses", type: :request do

  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:address) { create(:address, user_id: user.id.to_s) }

  describe "GET /address" do

    context "when user has an address" do
      before { get '/address', headers: authenticated_header_for_user_id(user.id.to_s) }

      it "should render a valid json" do
        expect(json["data"]["attributes"]["zip_code"]).to eq(address.zip_code)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when user does not have an address" do
      before { get '/address', headers: authenticated_header }

      it "should render a valid json" do
        expect(json["data"]).to be_nil
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /address" do
    before { post '/address', headers: authenticated_header_for_user_id(another_user.id.to_s), params: attributes_for(:address) }

    it "should render a valid json" do
      expect(json["data"]["attributes"]["zip_code"]).not_to be_empty
    end

    it "should return status code created" do
      expect(response).to have_http_status(:created)
    end

  end

  describe "PUT /address" do
    before { put '/address', headers: authenticated_header_for_user_id(user.id.to_s), params: attributes_for(:address) }

    it "should render a valid json" do
      expect(json["data"]["attributes"]["zip_code"]).not_to be_empty
    end

    it "should return status code 200" do
      expect(response).to have_http_status(200)
    end

  end
end
