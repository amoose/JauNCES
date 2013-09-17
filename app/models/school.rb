class School
  include Mongoid::Document

  after_validation :geocode

  field :nces_school_id
  field :state_school_id
  field :nces_district_id
  field :nces_state_district_id
  field :low_grade
  field :high_grade
  field :name
  field :district
  field :county
  field :street
  field :city
  field :state
  field :zip, :type => Integer
  field :zipfour, :type => Integer
  field :phone
  field :locale_code, :type => Integer
  field :locale
  field :charter, :type => Boolean
  field :magnet, :type => Boolean
  field :title_i, :type => Boolean
  field :title_i_wide, :type => Boolean
  field :students, :type => Integer
  field :teachers, :type => BigDecimal
  field :st_ratio, :type => Float
  field :free_lunch, :type => Integer
  field :reduced_lunch, :type => Integer

  field :coordinates, :type => Array

  include Geocoder::Model::Mongoid
  geocoded_by :address

  VALID_SEARCH_PARAMS = [
		:nces_school_id,
		:state_school_id,
		:low_grade,
		:high_grade,
		:name,
		:district,
		:county,
		:city,
		:state,
		:zip,
		:phone
	]

  def address
  	"#{self.street} #{self.city}, #{self.state} #{self.zip} US" # US ONLY
  end

  def self.generate_search_params(params)
    if params[:name] and params[:name].is_number? and params[:name].length == 5
      params[:zip] = params[:name].to_i 
      params.delete(:name)
    end
  	valid_params = params.keys.collect { |k| k.to_sym } & VALID_SEARCH_PARAMS
		query_params = {}
		valid_params.each { |p| query_params[p.to_sym] = params[p] }
		# [TODO] update method for string search on name from matching against only uppercase
		query_params[:name] = /.*#{query_params[:name].upcase}.*/ if query_params[:name]
		query_params
  end
end
