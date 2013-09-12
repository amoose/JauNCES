require 'spec_helper'

describe School do

  describe "#create" do

  	context "when creating a school" do
  		let(:school) do
	      Fabricate.build(:school)
	    end

	    it "should be valid" do
	    	school.should be_valid
	    end

	    it "should geocode based on the address" do
	    	school.save
	    	school.coordinates.should_not be_nil
	    end

	    it "should concatenate the full address for geocoding" do
	    	school.address.should include(school.street, school.city, school.state, school.zip.to_s)
	    end
  	end
  end

  describe "#search" do
  	context "when searching schools" do
  		it "should match against zip code" do
  			query_params = School.generate_search_params({ :zip => 12345 })
  			query_params.should include(:zip)
  		end
  	end
  end

  
end
