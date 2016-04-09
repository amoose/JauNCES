module ApplicationHelper
  def booleanize(str)
    
    if str.downcase.include? 'y'
      true
    else
      false
    end
  rescue
    nil
    
  end
end

class String
  def is_number?
    
    true if Float(self)
  rescue
    false
    
  end
end
