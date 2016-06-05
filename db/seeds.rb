require 'faker'

# Create Users
5.times do
  user = User.create!(
  first_name: Faker::Name.first_name,
  last_name:  Faker::Name.last_name,
  email:      Faker::Internet.email,
  password:   Faker::Lorem.characters(8)
  )
  user.save!
end
users = User.all

standard = User.create!(
  first_name:   "Wil",
  last_name:    "Burke",
  email:        "billyburke13@gmail.com",
  password:     "mustang13"
)
standard.save!

# Creates Registered Applications
20.times do
  rapp = RegisteredApplication.create!(
  name: Faker::Team.state,
  url:  Faker::Color.color_name,
  user: users.sample
  )
  rapp.save!
end
rapps = RegisteredApplication.all

#Creates Events
50.times do
  event = Event.create!(
  name: Faker::Team.sport,
  registered_application: rapps.sample,
  )
  event.save!
end
events = Event.all


#---------------------------------

puts "#{users.count} Users seeded."
puts "#{rapps.count} Applications seeded."
puts "#{events.count} Events seeded."
