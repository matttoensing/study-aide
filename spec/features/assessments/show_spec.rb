require 'rails_helper'

RSpec.describe 'assessment show page' do
  describe 'quiz game' do
    it 'user sees a question, 3 incorrect answers and 1 correct answer' do
      user = create(:user)
      quiz = create(:quiz, user: user)
      question = create(:question, quiz: quiz)
      question1 = create(:question, quiz: quiz)
      question2 = create(:question, quiz: quiz)
      question3 = create(:question, quiz: quiz)
      answer = create(:answer, question: question)
      answer1 = create(:answer, question: question)
      answer2 = create(:answer, question: question)
      answer3 = create(:answer, question: question)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/quizzes/#{quiz.id}/game"

      click_button 'Quiz'

      assessment = Assessment.last

      expect(current_path).to eq("/assessments/#{assessment.id}")

      expect(page).to have_content(question.question)
      expect(page).to have_content("Question #{quiz.questions.index(question) + 1} of #{quiz.questions.count}")

      within "#answer-#{answer.id}" do
        expect(page).to have_content(answer.answer)
      end
    end

    xit 'user clicks the correct answer to see the next question' do
      user = create(:user)
      quiz = create(:quiz, user: user)
      question = create(:question, quiz: quiz)
      question1 = create(:question, quiz: quiz)
      question2 = create(:question, quiz: quiz)
      question3 = create(:question, quiz: quiz)
      answer = create(:answer, question: question)
      answer1 = create(:answer, question: question)
      answer2 = create(:answer, question: question)
      answer3 = create(:answer, question: question)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/quizzes/#{quiz.id}/game"

      click_button 'Quiz'

      assessment = Assessment.last

      within "#answer-#{answer.id}" do
        click_button 'Select Answer'
      end

      expect(current_path).to eq("/assessments/#{assessment.id}")

      expect(page).to have_content(question1.question)
      expect(page).to have_content("Question #{quiz.questions.index(question1) + 1} of #{quiz.questions.count}")
    end
  end
end
