class Farm < ApplicationRecord
  has_many :farm_users
  has_many :users, through: :farm_users
  has_many :crops
  has_many :transactions
  attr_accessor :email
  
  def sum_transaction(trans_type)
    transactions.where(trans_type: trans_type).sum(:amount)
  end
  
end
