class Api::V1::SchoolsController < ApplicationController
	before_filter :allow_cross_origin

	def index
		@schools = School.all
		render :json => @schools
	end

	def search
		@schools = []
		render :json => @schools
	end

	def allow_cross_origin
    response.headers["Access-Control-Allow-Origin"]="*"
  end
end
