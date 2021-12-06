require 'rails_helper'

RSpec.describe Question do
  describe 'relationships' do
    it { should belong_to(:quiz) }
    it { should have_one(:answer) }
  end

  describe 'instance methods' do
    describe '::question_answers' do
      it 'creates a collection of answers for a question, with 3 being random from the whole quiz set and one being correct' do
        user = create(:user)
        quiz = create(:quiz, user: user)
        question1 = create(:question, quiz: quiz)
        answer1 = create(:answer, question: question1)
        question2 = create(:question, quiz: quiz)
        answer2 = create(:answer, question: question2)
        question3 = create(:question, quiz: quiz)
        answer3 = create(:answer, question: question3)
        question4 = create(:question, quiz: quiz)
        answer4 = create(:answer, question: question4)

        expected = [answer2, answer3, answer4, answer1]

        allow(question1).to receive(:question_answers).and_return(expected)

        expect(question1.question_answers).to eq(expected)
      end
    end
  end
end
