class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include Knock::Authenticable

  def index
    render html: "Welcome to C2C!"
  end

end
