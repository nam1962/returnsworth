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

# Order :
order1 = Order.create!(
  order_number: 1001,
  client_name: 'Client 1'
)

order2 = Order.create!(
  order_number: 1002,
  client_name: 'Client 2'
)

order3 = Order.create!(
  order_number: 1003,
  client_name: 'Client 3'
)

order4 = Order.create!(
  order_number: 1004,
  client_name: 'Client 4'
)

order5 = Order.create!(
  order_number: 1005,
  client_name: 'Client 5'
)

order6 = Order.create!(
  order_number: 1006,
  client_name: 'Client 6'
)

order7 = Order.create!(
  order_number: 1007,
  client_name: 'Client 7'
)

order8 = Order.create!(
  order_number: 1008,
  client_name: 'Client 8'
)

order9 = Order.create!(
  order_number: 1009,
  client_name: 'Client 9'
)

# OrderItem :
order_item1 = OrderItem.create!(
  order_id: order1.id
)

order_item2 = OrderItem.create!(
  order_id: order2.id
)

order_item3 = OrderItem.create!(
  order_id: order3.id
)

order_item4 = OrderItem.create!(
  order_id: order4.id
)

order_item5 = OrderItem.create!(
  order_id: order5.id
)

order_item6 = OrderItem.create!(
  order_id: order6.id
)

order_item7 = OrderItem.create!(
  order_id: order7.id
)

order_item8 = OrderItem.create!(
  order_id: order8.id
)

order_item9 = OrderItem.create!(
  order_id: order9.id
)

# Return :
return1 = Return.create!(
  command_number: '100001',
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
  command_number: '100002',
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

return3 = Return.create!(
  command_number: '100003',
  client_name: order3.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: nil,
  client_service_officer_id: user2.id
)

return4 = Return.create!(
  command_number: '100004',
  client_name: order4.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: nil,
  client_service_officer_id: user2.id
)

return5 = Return.create!(
  command_number: '100005',
  client_name: order5.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: nil,
  client_service_officer_id: user2.id
)

return6 = Return.create!(
  command_number: '100006',
  client_name: order6.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: nil,
  client_service_officer_id: user2.id
)

return7 = Return.create!(
  command_number: '100007',
  client_name: order7.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: nil,
  client_service_officer_id: user2.id
)

return8 = Return.create!(
  command_number: '100008',
  client_name: order8.client_name,
  status: 'pending',
  state: 'processed',
  comment: 'OK',
  additional_cost: '20',
  exception: 'none',
  restock: true,
  warehouse_operator_id: nil,
  client_service_officer_id: user2.id
)

return9 = Return.create!(
  command_number: '100009',
  client_name: order9.client_name,
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
ReturnItem.create!(
  return_id: return1.id,
  order_item_id: order_item1.id
)

ReturnItem.create!(
  return_id: return2.id,
  order_item_id: order_item2.id
)

ReturnItem.create!(
  return_id: return3.id,
  order_item_id: order_item3.id
)

ReturnItem.create!(
  return_id: return4.id,
  order_item_id: order_item4.id
)

ReturnItem.create!(
  return_id: return5.id,
  order_item_id: order_item5.id
)

ReturnItem.create!(
  return_id: return6.id,
  order_item_id: order_item6.id
)

ReturnItem.create!(
  return_id: return7.id,
  order_item_id: order_item7.id
)

ReturnItem.create!(
  return_id: return8.id,
  order_item_id: order_item8.id
)

ReturnItem.create!(
  return_id: return9.id,
  order_item_id: order_item9.id
)
puts "seed ended"
