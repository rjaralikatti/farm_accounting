class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :reason
      t.point :location
      t.string :bill_image_path
      t.text :description
      t.integer :debit_credit, size: 1
      t.float :amount

      t.timestamps
    end
  end
end
