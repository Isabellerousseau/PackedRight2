# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
Order.destroy_all
Parcel.destroy_all
Driver.destroy_all
User.destroy_all

User.create(email: "ashanti.richardson@gmail.com", created_at: "2020-03-04 10:04:14", updated_at: "2020-03-04 10:04:14", name: nil, phone_number: nil, admin: nil, location: nil, latitude: nil, longitude: nil, password: 'password')
User.create(email: "Isa@gmail.com", created_at: "2020-04-04 10:04:14", updated_at: "2020-06-04 10:04:14", name: nil, phone_number: nil, admin: nil, location: nil, latitude: nil, longitude: nil, password: 'password')
User.create(email: "Sara@gmail.com", created_at: "2020-05-04 10:04:14", updated_at: "2020-07-04 10:04:14", name: nil, phone_number: nil, admin: nil, location: nil, latitude: nil, longitude: nil, password: 'password')
User.create(email: "max@gmail.com", created_at: "2020-06-04 10:04:14", updated_at: "2020-08-04 10:04:14", name: nil, phone_number: nil, admin: nil, location: nil, latitude: nil, longitude: nil, password: 'password')

Parcel.create(name: "designer dress", weight: 1, category: "Bike", fragile: true, created_at: "2020-03-04 13:04:21", updated_at: "2020-03-04 13:04:21")
Parcel.create(name: "mini palmtree", weight: 100, category: "Car", fragile: true, created_at: "2020-04-04 13:04:21", updated_at: "2020-04-04 13:04:21")
Parcel.create(name: "painting", weight: 10, category: "Van", fragile: true, created_at: "2020-05-04 13:04:21", updated_at: "2020-05-04 13:04:21")

Driver.create(approved: nil, latitude: 52.3842045, longitude: 4.9029567, created_at: "2020-03-04 13:29:54", updated_at: "2020-03-04 13:33:57", user_id: User.first.id, address: "Haarlem", category: "Bike", active: true)
Driver.create(approved: nil, latitude: 52.3842045, longitude: 4.9029567, created_at: "2020-04-04 13:29:54", updated_at: "2020-04-04 13:33:57", user_id: User.second.id, address: "Amsterdam", category: "Van", active: true)
Driver.create(approved: nil, latitude: 52.3842045, longitude: 4.9029567, created_at: "2020-04-04 13:29:54", updated_at: "2020-04-04 13:33:57", user_id: User.fourth.id, address: "Amsterdam", category: "Car", active: true)
Driver.create(approved: nil, latitude: 52.3842045, longitude: 4.9029567, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", user_id: User.third.id, address: "Leiden", category: "Bike", active: true)

Order.create(status: nil, category: 0, weight: 1, fragile: true, driver_id: Driver.first.id, user: User.first, parcel: Parcel.first, pickup: "Den Haag", drop_off: "Maastricht", created_at: "2020-03-04 13:04:21", updated_at: "2020-03-04 13:04:21", pickup_time: nil)
Order.create(status: nil, category: 1, weight: 30, fragile: true, driver_id: Driver.second.id, user: User.second, parcel: Parcel.second, pickup: "Utrecht", drop_off: "Dordrecht", created_at: "2020-04-04 13:04:21", updated_at: "2020-04-04 13:04:21", pickup_time: nil)
Order.create(status: nil, category: 2, weight: 60, fragile: true, driver_id: Driver.third.id, user: User.third, parcel: Parcel.third, pickup: "Amsterdam", drop_off: "Leiden", created_at: "2020-05-04 13:04:21", updated_at: "2020-05-04 13:04:21", pickup_time: nil)
