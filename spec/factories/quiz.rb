FactoryBot.define do
  factory :quiz do
    subject { Faker::Beer.brand }
    description { Faker::Beer.style }
    name { Faker::Beer.name }
  end
end
