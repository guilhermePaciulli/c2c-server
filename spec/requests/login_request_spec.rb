require 'rails_helper'

RSpec.describe "Login", type: :request do

  let!(:user) { create(:user) }

  describe "POST #user_token" do
    context "with valid params" do
      before { post '/user_token', params: { :email => user.email, :password => "foobar" } }

      it "returns a valid json" do
        expect(json["jwt"]).not_to be_empty
      end

      it "renders a JSON response with the new user" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      before { post '/user_token', params: { :email => user.email, :password => "12345" } }

      it "renders a JSON response with errors for the new user" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

end
