class Purchase < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :product, :amount, :total_price
  validates_numericality_of :amount, :only_integer => true, :greater_than => 0
  validates_numericality_of :total_price, :greater_than_or_equal_to => 0
end
