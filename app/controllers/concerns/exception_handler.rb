module ExceptionHandler
  extend ActiveSupport::Concern

  included do

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end

  private
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  private
  def four_ninety_eight(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  private
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end
end
