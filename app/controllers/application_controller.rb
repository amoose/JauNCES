class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :default_request_city

  def default_request_city
  	@request_city = request.location.city.blank? ? "Washington, D.C." : request.location.city
  end
end
