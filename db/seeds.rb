require 'faker'

# Create Users
5.times do
  user = User.new
  user.first_name = Faker::Name.first_name,
  user.last_name =  Faker::Name.last_name,
  user.email =      Faker::Internet.email,
  user.password =   Faker::Lorem.characters(8)

  user.save!
end
users = User.all

unless User.find_by(email: 'billyburke13')
standard = User.new
  standard.first_name =   "Wil"
  standard.last_name =    "Burke"
  standard.email =        "billyburke13@gmail.com"
  standard.password =     "helloworld"

standard.save!
end

# Creates Registered Applications
20.times do
  ra = RegisteredApplication.new
  ra.name = Faker::Team.state
  ra.url =  Faker::Color.color_name
  ra.user = users.sample

  ra.save!
end
ra = RegisteredApplication.all

#Creates Events
50.times do
  e = Event.new
  e.name = Faker::Team.sport
  e.registered_application = ra.sample

  e.save!
end
e = Event.all


#---------------------------------

puts "#{users.count} Users seeded."
puts "#{ra.count} Applications seeded."
puts "#{e.count} Events seeded."
