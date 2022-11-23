# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating pizzas"
pizzas = []
pizzas << Pizza.create(name:"Marinara", ingredients:"tomatoes, garlic, oregano, and extra virgin olive oil")
pizzas << Pizza.create(name:"Margherita", ingredients:"tomatoes, sliced mozzarella, basil, and extra virgin olive oil")
pizzas << Pizza.create(name:"Margherita extra", ingredients:"tomatoes, mozzarella from Campania, basil, and extra virgin olive oil")
pizzas << Pizza.create(name:"Cheese", ingredients:"Dough, Tomato Sauce, Cheese")
pizzas << Pizza.create(name:"Pepperoni", ingredients:"Dough, Tomato Sauce, Cheese, Pepperoni")


puts "Creating restaurants"
restaurants = []
10.times do
    restaurants << Restaurant.create(name: Faker::Restaurant.name, address:Faker::Address.full_address)
end

puts "creating restaurant-pizzas"
10.times do
    RestaurantPizza.create(price: rand(2..29), pizza_id: pizzas.sample.id, restaurant_id: restaurants.sample.id)
end