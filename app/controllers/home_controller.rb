class HomeController < ApplicationController

	def index
		begin
			location = Geocoder::Query.new(@request_city)
			result = location.execute.first
			@schools ||= School.near(result).limit(10)
		rescue
			@schools = []
		end
	end

	def search
		@schools = School.any_of(School.generate_search_params(params)).limit(20)
	end

end
