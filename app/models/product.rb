class Product < ActiveRecord::Base
  validates_presence_of :title, :price
  validates_numericality_of :price
end
