class Transaction < ApplicationRecord
  
  belongs_to :crop
  belongs_to :farm
  
  scope :revenue, -> { where(trans_type: 'revenue') } 
  scope :investment, -> { where(trans_type: 'investment') } 
  scope :expense, -> { where(trans_type: 'expense') }
  
  validates :trans_type, uniqueness: true
  
  self.inheritance_column = :trans_type
  
  class << self
    def trans_types
      %w(Revenue Investment Expense)
    end
  end
  
end
