FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(min_length: 8, max_length: 20) }
  end
end
