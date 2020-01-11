require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe ".by_user" do
    it "returns the expenses for a certain user" do
      mario = FactoryBot.create(:user)
      franco = FactoryBot.create(:user)

      category_groceries = FactoryBot.create(:category, name: "Groceries", default: true)
      category_breakfast = FactoryBot.create(:category, name: "Breakfast", default: true)
      category_dinner = FactoryBot.create(:category, name: "Dinner", default: true)

      expense_1 = FactoryBot.create(:expense, user: mario, category: category_groceries, amount: 12.50, date: "2019/01/01")
      expense_2 = FactoryBot.create(:expense, user: mario, category: category_groceries, amount: 10, date: "2019/01/02")

      expect(Expense.by_user(mario)).to eq([expense_1, expense_2])
    end
  end
end
