require 'rails_helper'

RSpec.describe "CreditCards", type: :request do

  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:credit_card) { create(:credit_card, user_id: user.id.to_s) }

  describe "GET /credit_card" do

    context "when user has a credit card" do
      before { get '/credit_card', headers: authenticated_header_for_user_id(user.id.to_s) }

      it "should render a valid json" do
        attrs = json["data"]["attributes"]
        expect(attrs["expiration"]).to eq(credit_card.expiration)
        expect(attrs["cvv"]).to eq("***")
        number = attrs["number"]
        last_digits = number.to_s.length <= 4 ? number : number.to_s.slice(-4..-1)
        expect(attrs["number"]).to eq("************#{last_digits}")
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not have an credit_card" do
       before { get '/credit_card', headers: authenticated_header }

       it "should render a valid json" do
         expect(json["data"]).to be_nil
       end
       it 'returns status code 200' do
         expect(response).to have_http_status(200)
       end
     end
  end

  describe "POST /credit_card" do
    before { post '/credit_card', headers: authenticated_header_for_user_id(another_user.id.to_s), params: attributes_for(:credit_card) }

    it "should render a valid json" do
      expect(json["data"]["attributes"]["number"]).not_to be_empty
    end
    it "should return status code created" do
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /credit_card" do
    before { put '/credit_card', headers: authenticated_header_for_user_id(user.id.to_s), params: attributes_for(:credit_card) }

    it "should render a valid json" do
      expect(json["data"]["attributes"]["number"]).not_to be_empty
    end
    it "should return status code 200" do
      expect(response).to have_http_status(200)
    end
  end

end
