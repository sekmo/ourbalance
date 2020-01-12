class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :amount, presence: true

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
end
