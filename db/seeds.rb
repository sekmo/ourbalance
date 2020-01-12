# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if !Rails.env.production?
  ActiveRecord::Base.connection.tables.each do |table|
    if !table.in? ["schema_migrations", "ar_internal_metadata"]
      puts "Truncating #{table}."
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
    end
  end
end

categories = Expense::DEFAULT_CATEGORIES
categories.each do |category|
  Category.create(category.merge(default: true))
  puts "Created category #{category[:name]}."
end

user = User.create(email: "user@example.com", password: "password")
puts "Created user #{user.email}."

AMOUNT_OF_EXPENSES = 200
AMOUNT_OF_EXPENSES.times do
  Expense.create(
    user: user,
    category_id: rand(categories.size + 1),
    amount: rand(1000) / 10.0,
    date: Date.parse("1/12/2019") + (rand 31).days
  )
end
puts "Created #{AMOUNT_OF_EXPENSES} random expenses."
