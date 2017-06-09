class Farm < ApplicationRecord
  has_many :farm_users
  has_many :users, through: :farm_users
  attr_accessor :email
  
end
