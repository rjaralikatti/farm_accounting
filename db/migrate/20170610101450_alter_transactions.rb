class AlterTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :trans_type, :string
    add_column :transactions, :farm_id, :integer
    add_column :transactions, :crop_id, :integer
    add_column :transactions, :transaction_date, :datetime
    add_column :transactions, :transaction_method, :string
    add_column :transactions, :identifier, :string
    add_column :transactions, :place_of_transaction, :string
    add_column :transactions, :created_by, :integer
    add_column :transactions, :updated_by, :integer
  end
end
