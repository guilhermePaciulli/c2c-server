class AddressesController < ApplicationController
  before_action :authenticate_user
  before_action :set_address, only: [:show, :update]

  def show
    render AddressSerializer.new(@address).serializable_hash
  end

  def create
    @address = current_user.create_address(address_params)
    @address.save!
    render AddressSerializer.new(@address).serializable_hash, status: :created
  end

  def update
    @address.update!(address_params)
    render AddressSerializer.new(@address).serializable_hash
  end

  private
    def set_address
      @address = current_user.address
      if @address.present?
        puts "Hello"
      else
        puts "Goodbye"
      end
    end

    def address_params
      params.require(:address).permit(:zip_code, :complement)
    end
end
