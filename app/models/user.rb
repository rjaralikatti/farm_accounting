class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  has_and_belongs_to_many :oauth_credentials
  has_many :farm_users
  has_many :farms, through: :farm_users
  has_many :user_roles
  has_many :roles, through: :user_roles
  
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
  
  Role.all.each do |role|
    define_method("is_#{role.name}?") do
      !roles.find_by_name(role.name).nil?
    end
  end
  
  # def is_admin?
#     !roles.find_by_name('admin').nil?
#   end
  
end
