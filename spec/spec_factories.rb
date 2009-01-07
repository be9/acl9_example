require 'factory_girl'

Factory.define :product do |p|
  p.title "Cool Product"
  p.price "9.99"
end

Factory.define :purchase do |p|
  p.association :product
  p.amount 1
  p.total_price "19.99"
end
