class UsersController < ApplicationController

  # POST /users
  def create
    @user = User.new(user_params)
    @user.save!
    render :show, status: :created
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:email, :password, :password_confirmation, :surname, :cpf, :name)
    end
end
