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
Review.destroy_all
Driver.delete_all
User.delete_all

user1 = User.create(
  email: "ashanti.richardson@packedright.live",
  name: "Ashanti",
  phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user2 = User.create(
  email: "isa@packedright.live",
  name: "Isabelle",
  phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user3 = User.create(
  email: "sara@packedright.live",
  name: "Sara",
  phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user4 = User.create(
  email: "max@packedright.live",
  name: "Max", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user5 = User.create(
  email: "abel@packedright.live",
  name: "Abel", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user6 = User.create(
  email: "lily@packedright.live",
  name: "Lily", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user7 = User.create(
  email: "hannah@packedright.live",
  name: "Hannah", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user8 = User.create(
  email: "andrea@packedright.live",
  name: "Andrea", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user9 = User.create(
  email: "simone@packedright.live",
  name: "Simone", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user10 = User.create(
  email: "jerome@packedright.live",
  name: "Jerome", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)
user11 = User.create(
  email: "haarlem@packedright.live",
  name: "Dave", phone_number: nil,
  admin: nil,
  location: nil,
  latitude: nil,
  longitude: nil,
  password: 'password'
)

Driver.create(user_id: user1.id, approved: nil, latitude: 52.379100, longitude: 4.843040, created_at: "2020-03-04 13:29:54", updated_at: "2020-03-04 13:33:57", address: "Vrouwengelukhof 95, Amsterdam", category: "Bike", active: true)
Driver.create(user_id: user2.id, approved: nil, latitude: 52.350990, longitude: 4.888490, created_at: "2020-04-04 13:29:54", updated_at: "2020-04-04 13:33:57", address: "Rustenburgerstraat 435, Amsterdam", category: "Van", active: true)
Driver.create(user_id: user3.id, approved: nil, latitude: 52.358610, longitude: 4.878530, created_at: "2020-04-04 13:29:54", updated_at: "2020-04-04 13:33:57", address: "Paulus Potterstraat 50, Amsterdam", category: "Car", active: true)
Driver.create(user_id: user4.id, approved: nil, latitude: 52.173050, longitude: 4.472020, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "Merelstraat 20, Leiden", category: "Car", active: true)
Driver.create(user_id: user5.id, approved: nil, latitude: 52.197310, longitude: 5.420170, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "Ringdijk Bovenkerker Polder 10, Amstelveen", category: "Van", active: true)
Driver.create(user_id: user6.id, approved: nil, latitude: 52.304200, longitude: 4.694760, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "Marktplein 106, Hoofddorp", category: "Van", active: true)
Driver.create(user_id: user7.id, approved: nil, latitude: 52.361944, longitude: 4.733307, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "IJweg 411, Zwanenburg", category: "Car", active: true)
Driver.create(user_id: user8.id, approved: nil, latitude: 52.277328, longitude: 4.836940, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "Bovenkerkerweg 81, Amstelveen", category: "Van", active: true)
Driver.create(user_id: user9.id, approved: nil, latitude: 52.377810, longitude: 4.749300, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "Dennenlaan 80, Zwanenburg", category: "Bike", active: true)
Driver.create(user_id: user10.id, approved: nil, latitude: 52.241113, longitude: 4.817964, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "Thamerhorn 1, Uithoorn", category: "Car", active: true)
Driver.create(user_id: user11.id, approved: nil, latitude: 52.241113, longitude: 4.817964, created_at: "2020-05-04 13:29:54", updated_at: "2020-05-04 13:33:57", address: "Haarlem", category: "Car", active: true)
