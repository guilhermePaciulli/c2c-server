require 'rails_helper'

RSpec.describe "Addresses", type: :request do

  let!(:user) { create(:user) }

  describe "GET /address" do

    context "when user has an address" do
      before { get '/address', headers: authenticated_header_for_user_id(user.id.to_s) }

      it "should render a valid json" do
        expect(json["data"]["attributes"]["zip_code"]).toNot be_empty
      end

      it "should return status 200" do
        expect(response).to have_http_status(200)
      end

    end
  end
end
