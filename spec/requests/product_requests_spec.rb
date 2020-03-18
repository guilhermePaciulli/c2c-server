require 'rails_helper'

RSpec.describe "Products CRUD", type: :request do

  let!(:products) { create_list(:product, 10) }
  let!(:first_product) { products.first.id }

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
  end

  describe "get /products/:id" do
    before { get '/products/'+first_product.to_s }

    context 'when the record exists' do
      it 'should return the product data' do
        expect(json).not_to be_empty
        expect(json["data"]['id']).to eq(first_product.to_s)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      let(:first_product) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product with 'id'=100/)
      end
    end
  end

  describe 'POST /products' do
    context 'when the request is valid' do
      before { post '/products', headers: authenticated_header, params: { :name => "Jetski Fera", :price => 10.5, :description => "Jetski muito fera", :picture => Rack::Test::UploadedFile.new('spec/support/fixtures/img.jpg', 'image/jpg') } }

      it 'creates a fast product ad' do
        expect(json['data']['attributes']['name']).to eq('Jetski Fera')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/products', headers: authenticated_header, params: { :name => "Jetski Fera", :price => 10.5, :description => "Jetski muito fera" } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Picture can't be blank/)
      end
    end
  end

end
