class Assessment < ApplicationRecord
  belongs_to :quiz
  belongs_to :user
  has_many :questions, through: :quiz
end
