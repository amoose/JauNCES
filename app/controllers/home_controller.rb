class HomeController < ApplicationController

	def index
		Geocoder.config(
				:lookup => :bing,
		  	:api_key => ENV['BING_API_KEY'],
		  	:use_https => true,
			)
		begin
			@schools ||= School.near(@request_location).limit(10)
		rescue
			@schools = []
		end
	end

	def search
		@schools = School.any_of(School.generate_search_params(params)).limit(20)
	end

end
