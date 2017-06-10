json.extract! crop, :id, :name, :farm_id, :season, :sowing_date, :harvest_date, :area_covered, :covered_area_measure, :life_span_years, :life_span_months, :life_span_days, :description, :created_at, :updated_at
json.url crop_url(crop, format: :json)
