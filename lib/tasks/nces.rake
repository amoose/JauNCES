namespace :nces do

	namespace :import do
		desc "Imports all available CSV from lib/tasks/nces-data"
		task :csv_data => :environment do
			Dir.glob("#{ENV['NCES_IMPORT_DIR']}/*.csv") do |csv|
			  book = Roo::CSV.new(csv)
			  book.first_row.upto(book.last_row) do |row|
			  	@row_data = []
			  	book.first_column.upto(book.last_column) do |col|
			  		# puts book.cell(row,col)
			  		@row_data << book.cell(row,col)
			  	end
			  	puts "Row #{row} data:"
			  	pp @row_data
			  end
			end
		end
	end


	desc "Deletes current NCES data"
	task :cleanup => :environment do
		School.all.each {|s| s.destroy }
	end

end