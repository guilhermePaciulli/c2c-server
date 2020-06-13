class PurchaseController < ApplicationController
  before_action :authenticate_user
  before_action :set_product, only: [:buy]
  before_action :set_purchase, only: [:show, :delete]

  def buy
    copy_address = current_user.address.dup
    copy_credit_card = current_user.credit_card.dup
    copy_address.save!
    copy_credit_card.save!
    current_user.purchases.create!(product: @product,
                                   address: copy_address,
                                   credit_card: copy_credit_card,
                                   purchase_status: "waiting")
    render status: :created
  end

  def index
    purchases = current_user.purchases.where.not(purchase_status: "received")
    render json: BuyerSerializer.new(purchases).serializable_hash
  end

  def show
    render json: BuyerSerializer.new(@purchase).serializable_hash
  end

  def index_sells
    sells = Purchase.joins(:product).where(products: { owner: current_user.id })
                                    .where.not(purchases: { purchase_status: "received" })
    render json: SellerSerializer.new(sells).serializable_hash
  end

  def update
    purchase = Purchase.find(params[:id])
    next_status = purchase.next_purchase_status
    if (purchase.product.owner == current_user.id && next_status != "received") || (next_status == "received" && purchase.user_id == current_user.id)
      purchase.update!(purchase_status: next_status)
      json_response({ :purchase_status => next_status })
    else
      raise(ActiveRecord::RecordInvalid)
    end
  end

  def delete
    purchase = Purchase.find(params[:id])
    if purchase.product.owner != current_user.id && purchase.user_id != current_user.id
      render status: :unauthorized
    else
      purchase.destroy!
      render status: :no_content
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def set_purchase
      @purchase = Purchase.where(id: params[:id], user_id: current_user.id).first
    end

end
