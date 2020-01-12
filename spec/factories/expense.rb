FactoryBot.define do
  factory :expense do
    user
    date { Faker::Date.between(from: 3.months.ago, to: Date.today) }
    amount { Faker::Commerce.price(range: 0.10..100.0) }
    category
  end
end
