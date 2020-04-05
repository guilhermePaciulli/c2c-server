require 'rails_helper'

RSpec.describe "Users creation", type: :request do

  let!(:user_id) { create(:user).id.to_s }

  describe "POST #create" do
    context "with valid params" do
      before { post '/users', params: { :name => "Rogerinho",
                                        :surname => "do Ingá",
                                        :cpf => "41548807800",
                                        :password => "password@1",
                                        :email => "roger.inga@gmail.com",
                                        :profile_picture => Rack::Test::UploadedFile.new('spec/support/fixtures/img.jpg', 'image/jpg') } }

      it "creates a new User" do
        expect(response).to have_http_status(:created)
      end

      it "renders a JSON response with the new user" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      before { post '/users', params: { :name => "Rogerinho",
                                        :surname => "do Ingá",
                                        :cpf => "41548807800",
                                        :password => "password@1" } }

      it "renders a JSON response with errors for the new user" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET #show" do

    context "when user is authenticated with no params" do
      before { get '/user_info', headers: authenticated_header }

      it "should return the user" do
        expect(response).to have_http_status(200)
      end

      it "render a JSON response with the user attributes" do
        expect(json['data']['attributes']['name']).not_to be_nil
      end
    end

    context "when user is authenticated with valid params" do
      before { get '/user_info/'+user_id, headers: authenticated_header }

      it "should return the user" do
        expect(response).to have_http_status(200)
      end

      it "render a JSON response with the user attributes" do
        expect(json['data']['attributes']['name']).not_to be_nil
      end
    end

  end

end
