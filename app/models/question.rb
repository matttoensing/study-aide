class Question < ApplicationRecord
  belongs_to :quiz
  has_one :answer, dependent: :destroy

  def question_answers
    if self.quiz.answers.length < 4
      short_quiz_answers
    elsif self.quiz.answers.length >= 4
      quiz_answers = self.quiz.answers.sample(3)

      if quiz_answers.include?(self.answer)
        question_answers
      elsif quiz_answers.uniq.length != 3
        question_answers
      elsif quiz_answers.uniq.length == 3 && !quiz_answers.include?(self.answer)
        quiz_answers << self.answer
        return quiz_answers.shuffle
      end
    end 
  end

  def short_quiz_answers
    self.quiz.answers.shuffle
  end
end
