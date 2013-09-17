class HomeController < ApplicationController

	def index
		
		# begin
			@schools = School.near(@request_city).limit(10)
		# rescue
			# @schools = []
		# end
	end

	def search
		@schools = School.any_of(School.generate_search_params(params))
	end

end
