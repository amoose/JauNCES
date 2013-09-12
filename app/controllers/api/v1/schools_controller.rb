class Api::V1::SchoolsController < ApplicationController
	before_filter :allow_cross_origin

	def index
		@schools = School.limit(20)
		render :json => @schools
	end

	def search
		@schools = School.any_of(School.generate_search_params(params))
		render :json => @schools
	end

	def allow_cross_origin
    response.headers["Access-Control-Allow-Origin"]="*"
  end
end
