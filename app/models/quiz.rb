class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :answers, through: :questions

  def user_assessments
    self.assessments.where(user_id: self.user.id) || []
  end
end
