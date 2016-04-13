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
  field :zip, type: Integer
  field :zipfour, type: Integer
  field :phone
  field :locale_code, type: Integer
  field :locale
  field :charter, type: Boolean
  field :magnet, type: Boolean
  field :students, type: Integer
  field :teachers, type: BigDecimal
  field :st_ratio, type: Float
  field :free_lunch, type: Integer
  field :reduced_lunch, type: Integer
  field :coordinates, type: Array

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
  ].freeze

  def address
    "#{street} #{city}, #{state} #{zip} US" # US ONLY
  end

  def self.generate_search_params(params)
    if params[:query] && params[:query].is_number? && params[:query].length == 5
      # params[:zip] = 
      # params.delete(:query)
      return { zip: params[:query].to_i  }
    end

    valid_params = {}
    # VALID_SEARCH_PARAMS.each do |p|
    #   valid_params[p.to_sym] = /.*#{params[:query].upcase}.*/
    # end

    # valid_params = params.keys.collect(&:to_sym) & VALID_SEARCH_PARAMS
    # query_params = {}
    # valid_params.each { |p| query_params[p.to_sym] = params[p] }
    # [TODO] update method for string search on name from matching against only uppercase
    valid_params[:name] = /.*#{params[:query].upcase}.*/ if params[:query]
    # query_params
    valid_params
  end
end
