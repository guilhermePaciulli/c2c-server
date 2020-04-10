require 'rails_helper'

RSpec.describe "Addresses", type: :request do

  let!(:user) { create(:user) }
  let!(:address) { create(:address, user_id: user.id.to_s) }

  describe "GET /address" do

    context "when user has an address" do
      before { get '/address', headers: authenticated_header_for_user_id(user.id.to_s) }

      it "should render a valid json" do
        expect(json["data"]["attributes"]["zip_code"]).to eq(address.zip_code)
      end

    end
  end
end
