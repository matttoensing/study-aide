class Assessment < ApplicationRecord
  belongs_to :quiz
  belongs_to :user
  has_many :questions, through: :quiz
  has_many :answers, through: :quiz

  enum status: {'in-progress': 0, completed: 1, cancelled: 2}
end
