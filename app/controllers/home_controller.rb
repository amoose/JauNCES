class HomeController < ApplicationController
  def index
    Geocoder.configure(
      lookup: :bing,
      api_key: ENV['BING_API_KEY'],
      use_https: true,
      timeout: 30
    )
    begin
      @schools ||= School.near(@request_location).limit(10)
    rescue
      @schools = []
    end
  end

  def search
    skewl_params = School.generate_search_params(params)
    puts skewl_params
    @schools = School.any_of(skewl_params).limit(20)
  end
end
