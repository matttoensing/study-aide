class Question < ApplicationRecord
  belongs_to :quiz
  has_one :answer, dependent: :destroy

  def question_answers
    game_answers = [self.answer]
    quiz_answers = self.quiz.answers.shuffle

    until game_answers.length == 4
      quiz_answers.each do |answer|
        game_answers << answer
      end
    end

    game_answers.shuffle
  end
end
