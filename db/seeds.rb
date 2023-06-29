# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database"

User.destroy_all
# db/seeds.rb
puts "starting seed"
# User :
user1 = User.create!(
  email: 'amaury@lewagon.com',
  password: '123466',
  role: "warehouse_operator",
  first_name: 'Amaury',
  last_name: 'Amaury'
)

user2 = User.create!(
  email: 'celine@lewagon.com',
  password: '123466',
  role: "client_service_officer",
  first_name: 'Céline',
  last_name: 'Savary'
)

puts "seed ended"
