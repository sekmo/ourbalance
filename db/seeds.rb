# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DEFAULT_CATEGORIES = [
  { name: "Groceries" },
  { name: "Coffee and Cakes" },
  { name: "Dinner out" },
  { name: "Outing", description: "Beers etc." },
  { name: "Clothes and accessories" },
  { name: "Lunch and Brunch" },
  { name: "Office lunch" },
  { name: "Health and Fitness" },
  { name: "Electronics" },
  { name: "Home improvements", description: "Furniture, accessories" },
  { name: "Entertainment", description: "Movies, concerts, theatre" },
  { name: "Beauty", description: "Hairdresser/Barbershop, moisturizer, etc." },
  { name: "Culture and learning", description: "Books, courses" },
  { name: "Honey gifts" },
  { name: "Friends gifts" },
  { name: "Hobbies", description: "Beer-crafting, knitting, gardening, retrogaming " },
  { name: "Experiences", description: "Trips, bungee-jumping, etc." },
  { name: "Transport" }
]

if !Rails.env.production?
  ActiveRecord::Base.connection.tables.each do |table|
    if !table.in? ["schema_migrations", "ar_internal_metadata"]
      puts "Truncating #{table}."
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
    end
  end
end

DEFAULT_CATEGORIES.each do |category|
  Category.create(category.merge(default: true))
  puts "Created category #{category[:name]}."
end

user = User.create(email: "user@example.com", password: "password")
puts "Created user #{user.email}."

AMOUNT_OF_EXPENSES = 200
AMOUNT_OF_EXPENSES.times do
  Expense.create(user: user, category_id: rand(DEFAULT_CATEGORIES.size + 1), amount: rand(1000) / 10.0)
end
puts "Created #{AMOUNT_OF_EXPENSES} random expenses."
