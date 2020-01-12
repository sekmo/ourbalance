FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    default { true }
  end
end
