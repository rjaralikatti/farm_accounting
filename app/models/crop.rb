class Crop < ApplicationRecord
  
  def life_span
    life_span = (life_span_years.blank? ? "0" : life_span_years.to_s) + " Years "
    life_span = life_span + (life_span_months.blank? ? "0" : life_span_months.to_s) + " Months "
    life_span = life_span + (life_span_days.blank? ? "0" : life_span_days.to_s) + " Days "
    life_span
  end
end
