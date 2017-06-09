class FarmUser < ApplicationRecord
  belongs_to :farm
  belongs_to :user
  
  def self.get_farm_users(users, farm_id)
    farm_users = []
    FarmUser.where(farm_id: farm_id).delete_all
    users.each do |user|
      farm_users << FarmUser.new(farm_id: farm_id, user_id: user.id)
    end
    farm_users
  end
end
