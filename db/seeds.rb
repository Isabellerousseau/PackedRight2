# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# puts 'Creating 10 fake users...'
# 10.times do
#   user = User.new(
#     name: Faker::Name,
#     phone_number: Faker::PhoneNumber,
#     email: Faker::Internet.email,
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     rating: rand(0..5)
#   )
#   driver.save!
# end
# puts 'Finished!'

User.create(User id: 1, email: "ashanti.richardson@gmail.com", created_at: "2020-03-04 10:04:14", updated_at: "2020-03-04 10:04:14", name: nil, phone_number: nil, admin: nil, location: nil, latitude: nil, longitude: nil)
User.create(User id: 2, email: "Isa@gmail.com", created_at: "2020-04-04 10:04:14", updated_at: "2020-06-04 10:04:14", name: nil, phone_number: nil, admin: nil, location: nil, latitude: nil, longitude: nil)
User.create(User id: 3, email: "Sara@gmail.com", created_at: "2020-05-04 10:04:14", updated_at: "2020-07-04 10:04:14", name: nil, phone_number: nil, admin: nil, location: nil, latitude: nil, longitude: nil)

Order.create(id: 1, status: nil, category: 0, weight: 1, fragile: true, driver_id: nil, user_id: 1, parcel_id: 1, pickup: "Den Haag", drop_off: "Maastricht", created_at: "2020-03-04 13:04:21", updated_at: "2020-03-04 13:04:21", pickup_time: nil, now: nil)
Order.create(id: 2, status: nil, category: 1, weight: 30, fragile: true, driver_id: nil, user_id: 2, parcel_id: 2, pickup: "Utrecht", drop_off: "Dordrecht", created_at: "2020-04-04 13:04:21", updated_at: "2020-04-04 13:04:21", pickup_time: nil, now: nil)
Order.create(id: 3, status: nil, category: 2, weight: 60, fragile: true, driver_id: nil, user_id: 3, parcel_id: 3, pickup: "Amsterdam", drop_off: "Leiden", created_at: "2020-05-04 13:04:21", updated_at: "2020-05-04 13:04:21", pickup_time: nil, now: nil)

Parcel.create(id: 4, name: "designer dress", weight: 1, category: "Bike", fragile: true, created_at: "2020-03-04 13:04:21", updated_at: "2020-03-04 13:04:21")
Parcel.create(id: 4, name: "mini palmtree", weight: 100, category: "Car", fragile: true, created_at: "2020-04-04 13:04:21", updated_at: "2020-04-04 13:04:21")
Parcel.create(id: 4, name: "painting", weight: 10, category: "Van", fragile: true, created_at: "2020-05-04 13:04:21", updated_at: "2020-05-04 13:04:21")
