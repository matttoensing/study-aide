class Question < ApplicationRecord
  belongs_to :quiz
  has_one :answer, dependent: :destroy

  def question_answers
    answers = [self.answer]
    quiz_answers = self.quiz.answers.shuffle
    
    until answers.length == 4
      quiz_answers.each do |answer|
        answers << answer
      end
    end
    answers.shiffle
  end
end
