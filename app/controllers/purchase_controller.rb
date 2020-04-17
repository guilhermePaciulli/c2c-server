class PurchaseController < ApplicationController
  before_action :authenticate_user
  before_action :set_product, only: [:buy]

  def buy
    current_user.purchases.create!(product: @product, purchase_status: 0)
    render status: :created
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

end
