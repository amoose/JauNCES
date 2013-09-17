require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
require "pp"

def create_school(row_data)
	School.create(
		:nces_school_id => row_data[0],
		:state_school_id => row_data[1],
		:nces_district_id => row_data[2],
		:nces_state_district_id => row_data[3],
		:low_grade => row_data[4],
		:high_grade => row_data[5],
		:name => row_data[6],
		:district => row_data[7],
		:county => row_data[8],
		:street => row_data[9],
		:city => row_data[10],
		:state => row_data[11],
		:zip => row_data[12].to_i,
		:zipfour => row_data[13].to_i,
		:phone => row_data[14],
		:locale_code => row_data[15].to_i,
		:locale => row_data[16],
		:charter => booleanize(row_data[17]),
		:magnet => booleanize(row_data[18]),
		:title_i => booleanize(row_data[19]),
		:title_i_wide => booleanize(row_data[20]),
		:students => row_data[21].to_i,
		:teachers => row_data[22].to_f,
		:st_ratio => row_data[23].to_f,
		:free_lunch => row_data[24].to_i,
		:reduced_lunch => row_data[25].to_i
	) unless row_data.empty?
end


namespace :nces do

	namespace :import do
		desc "Imports NCES data via NCES_IMPORT_API"
		task :api => :environment do
			pp "Fetching entries via API: #{ENV['NCES_IMPORT_API']}"
			response = HTTParty.get(ENV['NCES_IMPORT_API'])
			json = JSON.parse(response.body)
			pp "Fetched #{json["data"].size} entries via API. Inserting..."
			json['data'].each do |row|
				
				schoo = create_school([
						row[8],
						row[12],
						row[10],
						nil,
						row[36],
						row[37],
						row[15],
						row[14],
						row[33],
						row[22],
						row[23],
						row[24],
						row[25],
						row[26],
						row[16],
						row[29],
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil
					])
				pp schoo.inspect
			end
		end


		desc "Imports all available CSV from ENV: NCES_IMPORT_DIR"
		task :csv => :environment do
			Dir.glob("#{ENV['NCES_IMPORT_DIR']}/*.csv") do |csv|
			  book = Roo::CSV.new(csv)
			  rows = 0
			  # [TODO] determine header row
			  # [TODO] create map of fields and data types
			  # 8.upto(book.last_row) do |row|
			  8.upto(10) do |row|
			  	row_data = []
			  	book.first_column.upto(book.last_column) do |col|
			  		begin
			  			row_data << book.cell(row,col) || nil
			  		rescue
			  			row_data = []
			  			puts ">> An error occurred preparing data from row #: #{row}"
			  		end
			  	end
			  	create_school(row_data)
			  	rows = rows+1
			  end

			  puts "Created #{rows} schools from #{csv}."
			end
		end
	end


	desc "Deletes current NCES data"
	task :cleanup => :environment do
		schools = 0
		School.all.each {|s| s.destroy; schools = schools+1 }
		puts "Destroyed #{schools} schools."
	end

end