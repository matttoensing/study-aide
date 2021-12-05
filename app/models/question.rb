class Question < ApplicationRecord
  belongs_to :quiz
  has_one :answer
end
