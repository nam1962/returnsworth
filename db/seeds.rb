# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

puts "cleaning database"
Item.destroy_all
Return.destroy_all
Order.destroy_all
User.destroy_all


Dir.glob(Rails.root.join('app', 'assets', 'images', 'qr_codes', '*')).each do |filename|
  File.delete(filename)
end


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
  first_name: "Céline",
  last_name: "CSO",
  admin: true
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
customer_first_names = ["Anna", "Cécile", "Camila", "Aurora", "Nadia", "Charlotte", "Camille", "Jeanne", "Justine", "Wendy"]
customer_last_names = ["Dupont", "Durand", "Dubois", "Petit", "Lambert", "Martin", "Fontaine", "Vasseur", "Dupuis", "Royer"]
item_names = ["Bérénice", "Albertine", "Judith", "Juliette", "Sandra", "Isabella", "Charlotte", "Scarlett", "Naomi", "Natalie", "Kate", "Megan", "Emma", "Charlize", "Keira"]
item_name = item_names.sample
orders = (1..40).map do |i|
  customer_first_name = customer_first_names.sample
  customer_last_name = customer_last_names.sample
  customer_name = "#{customer_first_name} #{customer_last_name}"
  Order.create!(order_number: 1000 + i, client_name: customer_name)
end

# Items:

orders.each do |order|
  rand(1..5).times do
    Item.create!(
      name: item_name,
      order: order,
      restock: false,
      produit: false,
      emballage: false,
      additional_cost: nil,
    )
  end
end

# Returns:
2.times do |i|
  Return.create!(
    status: 'completed',
    comment: " ",
    warehouse_operator_id: amaury.id,
    client_service_officer_id: officers.sample.id,
    order: orders.sample
  )
end

# à garder à la fin
order_1 = Order.create!(
  order_number: 2683,
  client_name: "Marie-Line Monnerot"
)

order_2 = Order.create!(
  order_number: 2987,
  client_name: "Annie Versère"
)

Item.create!(
  name: "Charlotte",
  order: order_1,
  restock: false,
  produit: false,
  emballage: false,
  additional_cost: nil
)

Item.create!(
  name: "Sandra",
  order: order_1,
  restock: false,
  produit: false,
  emballage: false,
  additional_cost: nil
)

Item.create!(
  name: "Naomi",
  order: order_2,
  restock: false,
  produit: false,
  emballage: false,
  additional_cost: nil
)

return_1 = Return.create!(
  comment: "",
  warehouse_operator: amaury,
  client_service_officer: celine,
  order: order_1
)

return_2 = Return.create!(
  comment: "",
  warehouse_operator: amaury,
  client_service_officer: celine,
  order: order_2
)

Return.find(101).update!(id: 223316) if Return.find_by(id: 101)
Return.find(102).update!(id: 221317) if Return.find_by(id: 102)

return_1.update!(id: 101)
return_2.update!(id: 102)

puts "seed finished"
