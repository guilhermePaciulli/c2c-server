class PurchaseController < ApplicationController
  before_action :authenticate_user
  before_action :set_product, only: [:buy]
  before_action :set_purchase, only: [:show]

  def buy
    current_user.purchases.create!(product: @product, purchase_status: "received")
    render status: :created
  end

  def index
    json_response(current_user.purchases.where.not(purchase_status: "received"))
  end

  def show
    json_response(@purchase)
  end

  def index_sells
    sells = Purchase.joins(:product).where(products: { owner: current_user.id })
                                    .where.not(purchases: { purchase_status: "received" })
    json_response(sells)
  end

  def update
    purchase = Purchase.find(params[:id])
    next_status = purchase.next_purchase_status
    if (next_status == "received" && purchase.user_id != current_user.id) || (purchase.product.owner != current_user.id)
      raise(ActiveRecord::RecordInvalid)
    end
    purchase.update!(purchase_status: next_status)
    json_response({ :purchase_status => next_status })
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def set_purchase
      @purchase = Purchase.where(id: params[:id], user_id: current_user.id).first
    end

end
