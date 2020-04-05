class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  before_action :set_user, only: [:show]

  def create
    @user = User.new(user_params)
    @user.save!
    render :show, status: :created
  end

  def show
    if @user
      render json: UserSerializer.new(@user).serializable_hash
    else
      render json: OpenUserSerializer.new(current_user).serializable_hash
    end
  end

  private
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      end
    end
    def user_params
      params.permit(:email, :password, :password_confirmation, :surname, :cpf, :name, :profile_picture)
    end
end
