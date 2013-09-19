class HomeController < ApplicationController

	def index
		logger.info @request_city
		logger.info "---"
		logger.info request
		@schools = School.near(@request_city).limit(10)
	end

	def search
		@schools = School.any_of(School.generate_search_params(params)).limit(20)
	end

end
