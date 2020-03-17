require 'rails_helper'

RSpec.describe UsersController, type: :request do

  describe "POST #create" do
    context "with valid params" do
      before { post '/users', params: { :name => "Rogerinho",
                                        :surname => "do Ingá",
                                        :cpf => "41548807800",
                                        :password => "password@1",
                                        :email => "roger.inga@gmail.com" } }

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

end
