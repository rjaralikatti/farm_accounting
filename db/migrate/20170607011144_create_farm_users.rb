class CreateFarmUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :farm_users do |t|
      t.integer :farm_id
      t.integer :user_id

      t.timestamps
    end
  end
end
