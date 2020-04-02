class ProductsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
    render json: ProductSerializer.new(@products).serializable_hash
  end

  def show
    render json: ProductSerializer.new(@product).serializable_hash
  end

  def create
    @product = Product.new(product_params)
    @product.save!
    render json: ProductSerializer.new(@product).serializable_hash, status: :created, location: @product
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.permit(:name, :description, :price, :picture)
    end
end
