require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :item do |i|
  i.name 'Test Item'
  i.descr 'Testing Item'
  i.price 1.01
end

