class CreateFarms < ActiveRecord::Migration[5.1]
  def change
    create_table :farms do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
