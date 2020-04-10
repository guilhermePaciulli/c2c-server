require 'rails_helper'

RSpec.describe "Addresses", type: :request do

  let!(:user) { create(:user) }
  let!(:address) { create(:address, user_id: user.id) }


  describe "GET /addresses" do

    context "when user has an address" do
      before { get '/addresses' headers:  }

      it "works! (now write some real specs)" do
        get addresses_path
        expect(response).to have_http_status(200)
      end

    end
  end
end
