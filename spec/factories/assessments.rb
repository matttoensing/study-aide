FactoryBot.define do
  factory :assessment do
    status { 1 }
    score { 1.5 }
    number_of_questions { 1 }
    quiz { nil }
    user { nil }
  end
end
