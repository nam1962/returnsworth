# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

puts "cleaning database"
Return.destroy_all
Item.destroy_all
Order.destroy_all
User.destroy_all

puts "starting seed"

# Create Amaury and Celine:
amaury = User.create!(
  email: "amaury@lewagon.com",
  password: "123456",
  role: "warehouse_operator",
  first_name: "Amaury",
  last_name: "WH"
)
amaury.save!
file_amaury = URI.open("https://avatars.githubusercontent.com/u/7419235?v=4")
amaury.photo.attach(io: file_amaury, filename: "nes.png", content_type: "image/png")

celine = User.create!(
  email: "celine@lewagon.com",
  password: "123456",
  role: "client_service_officer",
  first_name: "Celine",
  last_name: "CSO"
)
celine.save!
file_celine = URI.open("https://avatars.githubusercontent.com/u/121505176?v=4")
celine.photo.attach(io: file_celine, filename: "nes.png", content_type: "image/png")

# Users:
officers = [celine] + 3.times.map do |i|
  User.create!(
    email: "officer#{i + 2}@lewagon.com",
    password: "123456",
    role: "client_service_officer",
    first_name: "Officer",
    last_name: "CSO#{i + 2}"
  )
end

operators = [amaury] + 5.times.map do |i|
  User.create!(
    email: "operator#{i + 2}@lewagon.com",
    password: "123456",
    role: "warehouse_operator",
    first_name: "Operator",
    last_name: "WH#{i + 2}"
  )
end

# Orders:
orders = (1..40).map do |i|
  Order.create!(order_number: 1000 + i, client_name: "Client #{i}")
end

# Items:
item_names = ["item1", "item2", "item3", "item4"]
orders.each do |order|
  rand(1..4).times do
    Item.create!(
      name: item_names.sample,
      order: order,
      restock: [true, false].sample,
      produit: [true, false].sample,
      emballage: [true, false].sample,
      additional_cost: rand(10..50),
    )
  end
end

# Returns:
20.times do |i|
  Return.create!(
    status: ['pending', 'completed'].sample, # Random status
    state: ['processed', 'unprocessed'].sample, # Random state
    comment: 'OK',
    warehouse_operator_id: operators.sample.id,
    client_service_officer_id: officers.sample.id,
    order: orders.sample
  )
end

puts "seed finished"
