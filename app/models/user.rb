class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_and_belongs_to_many :oauth_credentials
  has_many :farm_users
  has_many :farms, through: :farm_users
  
  def to_s
    email
  end
  
  def self.get_users(emails)
    users = []
    emails.split(';').each do |email|
      users << find_by_email(email)
    end
    users
  end
  
  # def admin?
#     self.admin == true
#   end
end
