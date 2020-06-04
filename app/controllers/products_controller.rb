class ProductsController < ApplicationController
  before_action :authenticate_user, only: [:create, :user_products, :activation]
  before_action :set_product, only: [:show, :set_product]

  def index
    if current_user.present?
      @products = Product.where.not(owner: current_user.id).where.not(is_active: false)
    else
      @products = Product.where(is_active: true)
    end
    render json: ProductSerializer.new(@products).serializable_hash
  end

  def user_products
    render json: ProductSerializer.new(current_user.products).serializable_hash
  end

  def show
    render json: ProductSerializer.new(@product).serializable_hash
  end

  def create
    @product = current_user.products.create!(product_params)
    render json: ProductSerializer.new(@product).serializable_hash, status: :created
  end

  def activation
    product = Product.where(id: params[:id], owner: current_user.id).first
    if product == nil
      render status: :not_found
    else
      product.update!(is_active: product.is_active)
      render status: :no_content
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.permit(:name, :description, :price, :picture)
    end
end
