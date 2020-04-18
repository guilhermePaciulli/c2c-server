class PurchaseController < ApplicationController
  before_action :authenticate_user
  before_action :set_product, only: [:buy]
  before_action :set_purchae, only: [:show]

  def buy
    current_user.purchases.create!(product: @product, purchase_status: 0)
    render status: :created
  end

  def index
    json_response(current_user.purchases)
  end

  def show
    json_response(@purchase)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def set_purchae
      @purchase = Purchase.where(id: params[:id], user_id: current_user.id).first
    end

end
