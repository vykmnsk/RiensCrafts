# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#puts 'setting up DEFAULT USER LOGIN'
#user = User.create! :name => 'First User', :email => 'vykmnsk@gmail.com', :password => 'letmein', :password_confirmation => 'letmein'
#puts 'New user created: ' << user.name


puts 'setting up GRUPS ...'

group = Group.create! :name => 'Cards'
puts "New GROUP created: " << group.name

group = Group.create! :name => 'Toys'
puts "New GROUP created: " << group.name

group = Group.create! :name => 'Shirts'
puts "New GROUP created: " << group.name

group = Group.create! :name => 'Coffee'
puts "New GROUP created: " << group.name