FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.org" }
    password { Faker::Internet.password(min_length: 8) }
  end
end
