require 'rails_helper'

RSpec.describe "Products API", type: :request do

  let!(:products) { create_list(:product, 10) }

  describe "get /products" do
    context 'when no params are informed' do
      before { get "/products" }

      it 'should return all products' do
        expect(json).not_to be_empty
        expect(json["data"].size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when params are informed' do
      before { get '/products/1' }

      it 'should return the product with id 1' do
        expect(json["data"]).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

end
