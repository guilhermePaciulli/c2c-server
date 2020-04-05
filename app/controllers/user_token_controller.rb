class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token, raise: false

  def auth_params
    params.permit(:email, :password)
  end

end
