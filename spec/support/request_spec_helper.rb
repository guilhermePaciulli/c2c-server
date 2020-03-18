module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: create(:user).id }).token
    {
      'Authorization': "Bearer #{token}"
    }
  end

end
