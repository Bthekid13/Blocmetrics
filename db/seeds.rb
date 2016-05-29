require 'faker'

# Create Users
5.times do
  user = User.new(
  first_name: Faker::Name.first_name,
  last_name:  Faker::Name.last_name,
  email:      Faker::Internet.email,
  password:   Faker::Lorem.characters(8)
  )
  user.save!
end
users = User.all

# Creates Registered Applications
20.times do
  rapp = RegisteredApplication.new
  rapp.name = Faker::Team.state
  rapp.user = users.sample
  rapp.save!
end
rapps = RegisteredApplication.all

#---------------------------------

puts "#{users.count} Users seeded"
puts "#{rapps.count} Applications seeded"
