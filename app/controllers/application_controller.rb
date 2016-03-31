class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :default_request_city

  def default_request_city
    begin
  	 @request_city = request.location.city.blank? ?
      "Washington, DC" : "#{request.location.data['city']}, #{request.location.data['region_code']}, #{request.location.data['country_code']}"
    rescue
      @request_city = "Washington, DC"
    end
  end
end
