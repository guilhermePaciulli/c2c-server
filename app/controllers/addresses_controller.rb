class AddressesController < ApplicationController
  before_action :authenticate_user
  before_action :set_address, only: [:show, :update]

  def show
    render json: AddressSerializer.new(@address).serializable_hash
  end

  def create
    @address = current_user.create_address(address_params)
    @address.save!
    render json: AddressSerializer.new(@address).serializable_hash, status: :created
  end

  def update
    @address.update!(address_params)
    render json: AddressSerializer.new(@address).serializable_hash
  end

  private
    def set_address
      @address = current_user.address
    end

    def address_params
      params.permit(:zip_code, :complement, :number)
    end
end
