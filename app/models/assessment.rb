class Assessment < ApplicationRecord
  belongs_to :quiz
  belongs_to :user
  has_many :questions, through: :quiz
  has_many :answers, through: :quiz

  enum status: {'in-progress': 0, completed: 1, cancelled: 2}

  def finish_assessment
    time = self.finishing_time.strftime('%s').to_i - self.starting_time.strftime('%s').to_i
    self.update(completed_time: time)
  end

  def percent_correct
    (self.score / self.number_of_questions) * 100
  end
end
