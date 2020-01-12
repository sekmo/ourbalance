require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe ".by_user" do
    it "returns the expenses for a certain user" do
      mario = FactoryBot.create(:user)
      franco = FactoryBot.create(:user)

      mario_expense_1 = FactoryBot.create(:expense, user: mario)
      mario_expense_2 = FactoryBot.create(:expense, user: mario)
      franco_expense_2 = FactoryBot.create(:expense, user: franco)

      expect(Expense.by_user(mario)).to eq([mario_expense_1, mario_expense_2])
    end
  end
end
