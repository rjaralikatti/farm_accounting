class AlterTransactionDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :transaction_date, :datetime
    add_column :transactions, :transaction_date, :date
    add_column :transactions, :bill_details, :string
  end
end
