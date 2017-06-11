class Transaction < ApplicationRecord
  
  belongs_to :crop, optional: true
  belongs_to :farm
  
  scope :revenue, -> { where(trans_type: 'revenue') } 
  scope :investment, -> { where(trans_type: 'investment') } 
  scope :expense, -> { where(trans_type: 'expense') }
  
  validates :transaction_date, :farm_id, :transaction_method, :place_of_transaction, presence: true
  
  self.inheritance_column = :trans_type
  
  class << self
    def trans_types
      %w(Revenue Investment Expense)
    end
  end
  
end
