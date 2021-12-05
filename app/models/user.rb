class User < ApplicationRecord
  has_many :quizzes

  validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }

  has_secure_password
end
