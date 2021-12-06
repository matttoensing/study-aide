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


        expect(question1.question_answers.length).to eq(4)
      end

      it 'creates a collection of answers for all answers if the quiz questions length is shorter than 4' do
        user = create(:user)
        quiz = create(:quiz, user: user)
        question1 = create(:question, quiz: quiz)
        answer1 = create(:answer, question: question1)
        question2 = create(:question, quiz: quiz)
        answer2 = create(:answer, question: question2)
        question3 = create(:question, quiz: quiz)
        answer3 = create(:answer, question: question3)


        expect(question1.question_answers.length).to eq(3)
      end
    end
  end
end
