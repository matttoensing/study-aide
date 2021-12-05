FactoryBot.define do
  factory :question do
    question { Faker::Quote.jack_handey  }
  end
end
