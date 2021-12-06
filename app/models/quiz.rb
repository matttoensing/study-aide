class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :answers, through: :questions
end
