# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database"
ReturnItem.destroy_all
OrderItem.destroy_all
Return.destroy_all
Order.destroy_all
User.destroy_all
# db/seeds.rb
puts "starting seed"
# User :
user1 = User.create!(
  email: 'amaury@lewagon.com',
  password: '123456',
  role: "warehouse_operator",
  first_name: 'Amaury',
  last_name: 'Amaury'
)

user2 = User.create!(
  email: 'celine@lewagon.com',
  password: '123456',
  role: "client_service_officer",
  first_name: 'Céline',
  last_name: 'Savary'
)

# Order :
order1 = Order.create!(
  order_number: 1001,
  client_name: 'Noréa'
)

order2 = Order.create!(
  order_number: 1002,
  client_name: 'Noréabis'
)

# OrderItem :
order_item1 = OrderItem.create!(
  order_id: order1.id
)

order_item2 = OrderItem.create!(
  order_id: order2.id
)

order_item3 = OrderItem.create!(
  order_id: order2.id
)

# Return :
return1 = Return.create!(
  command_number: '12345',
  client_name: order1.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: user1.id,
  client_service_officer_id: user2.id
)

return2 = Return.create!(
  command_number: '54321',
  client_name: order2.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: nil,
  client_service_officer_id: user2.id
)

# ReturnItem :
return_item1 = ReturnItem.create!(
  return_id: return1.id,
  order_item_id: order_item1.id
)

return_item2 = ReturnItem.create!(
  return_id: return2.id,
  order_item_id: order_item2.id
)

puts "seed ended"
