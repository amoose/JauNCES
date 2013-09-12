module ApplicationHelper
	def booleanize(str)
		if str.downcase.include? "y"
			true
		else
			false
		end
	end
end
