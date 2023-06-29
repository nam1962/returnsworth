# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

puts "cleaning database"
ReturnItem.destroy_all
OrderItem.destroy_all
Return.destroy_all
Order.destroy_all
User.destroy_all

puts "starting seed"

# Create Amaury and Celine:
amaury = User.create!(
  email: "amaury@lewagon.com",
  password: "123456",
  role: "client_service_officer",
  first_name: "Amaury",
  last_name: "CSO"
)

celine = User.create!(
  email: "celine@lewagon.com",
  password: "123456",
  role: "warehouse_operator",
  first_name: "Celine",
  last_name: "WH"
)

# Users:
officers = [amaury] + 3.times.map do |i|
  User.create!(
    email: "officer#{i + 2}@lewagon.com",
    password: "123456",
    role: "client_service_officer",
    first_name: "Officer",
    last_name: "CSO#{i + 2}"
  )
end

operators = [celine] + 5.times.map do |i|
  User.create!(
    email: "operator#{i + 2}@lewagon.com",
    password: "123456",
    role: "warehouse_operator",
    first_name: "Operator",
    last_name: "WH#{i + 2}"
  )
end

# Orders:
(1..9).each do |i|
  Order.create!(order_number: 1000 + i, client_name: "Client #{i}")
end

# OrderItems:
Order.all.each do |order|
  OrderItem.create!(order_id: order.id)
end

# Returns:
20.times do |i|
  Return.create!(
    command_number: "10000#{i + 1}",
    client_name: "Client #{i % 9 + 1}", # Ensure client_name matches an existing order
    status: ['pending', 'completed'].sample, # Random status
    state: ['processed', 'unprocessed'].sample, # Random state
    comment: 'OK',
    additional_cost: rand(10..50), # Random additional cost
    exception: 'none',
    restock: [true, false].sample, # Random restock
    warehouse_operator_id: operators.sample.id,
    client_service_officer_id: officers.sample.id
  )
end

# ReturnItems:
Return.all.each do |return_item|
  ReturnItem.create!(return_id: return_item.id, order_item_id: OrderItem.all.sample.id)
end

puts "seed finished"
