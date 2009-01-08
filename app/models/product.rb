class Product < ActiveRecord::Base
  validates_presence_of :title, :price
  validates_numericality_of :price, :greater_than_or_equal_to => 0

  acts_as_authorization_object
end
