class Farm < ApplicationRecord
  has_many :farm_users
  has_many :users, through: :farm_users
  has_many :crops
  has_many :transactions
  attr_accessor :email
  
end
