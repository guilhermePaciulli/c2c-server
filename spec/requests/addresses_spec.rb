require 'rails_helper'

RSpec.describe "Addresses", type: :request do

  let!(:user_id) { create(:user).id }
  let!(:address) { create(:address, users_id: user_id) }

  describe "GET /addresses" do

    context "when user has an address" do
      before { get '/addresses', headers: authenticated_header_for_user_id(user_id) }

      it "should render a valid json" do
        expect(json["data"]["attributes"]["zip_code"]).toNot be_empty
      end

      it "should return status 200" do
        expect(response).to have_http_status(200)
      end

    end
  end
end
