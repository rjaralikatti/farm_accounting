class CreateCrops < ActiveRecord::Migration[5.1]
  def change
    create_table :crops do |t|
      t.string :name
      t.integer :farm_id
      t.string :season
      t.date :sowing_date
      t.date :harvest_date
      t.integer :area_covered
      t.string :covered_area_measure
      t.integer :life_span_years
      t.integer :life_span_months
      t.integer :life_span_days
      t.text :description

      t.timestamps
    end
  end
end
