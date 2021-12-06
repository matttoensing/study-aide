require 'rails_helper'

RSpec.describe Quiz do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:questions) }
    it { should have_many(:assessments) }
    it { should have_many(:answers).through(:questions) }
  end

  describe 'instance methods' do
    describe '::user_assessments' do
      it 'can find all users assessments for a specific quiz' do
        user = create(:user)
        user2 = create(:user)
        quiz = create(:quiz, user: user)
        quiz2 = create(:quiz, user: user)
        assessment = create(:assessment, quiz: quiz, user: user)
        assessment2 = create(:assessment, quiz: quiz, user: user)
        assessment3 = create(:assessment, quiz: quiz2, user: user)
        assessment4 = create(:assessment, quiz: quiz2, user: user)
        assessment5 = create(:assessment, quiz: quiz2, user: user)
        assessment6 = create(:assessment, quiz: quiz2, user: user2)
        assessment6 = create(:assessment, quiz: quiz, user: user2)

        expected1 = [assessment, assessment2]
        expected2 = [assessment3, assessment4, assessment5]

        expect(quiz.user_assessments).to eq(expected1)
        expect(quiz2.user_assessments).to eq(expected2)
      end

      it 'will return empty array if user has no assessments' do
        user = create(:user)
        quiz = create(:quiz, user: user)

        expect(quiz.user_assessments).to eq([])
      end
    end
  end
end
