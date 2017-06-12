module ApplicationHelper
  
  def number_to_indian_currency(number) 
    "Rs. #{number.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")}" 
  end
end
