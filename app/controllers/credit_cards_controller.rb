class CreditCardsController < ApplicationController
  before_action :authenticate_user
  before_action :set_credit_card, only: [:show, :update]

  def show
    render json: CreditCardSerializer.new(@credit_card).serializable_hash
  end

  def create
    @credit_card = current_user.create_credit_card(credit_card_params)
    @credit_card.save!
    render json: CreditCardSerializer.new(@credit_card).serializable_hash, status: :created
  end

  def update
    @credit_card.update(credit_card_params)
    render json: CreditCardSerializer.new(@credit_card).serializable_hash
  end

  private
    def set_credit_card
      @credit_card = current_user.credit_card
    end

    def credit_card_params
      params.permit(:number, :expiration, :cvv, :owner)
    end
end
