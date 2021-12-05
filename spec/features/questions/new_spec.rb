require 'rails_helper'

RSpec.describe 'new questions' do
  describe 'happy path' do
    it 'user can submit a question and an answer for a quiz' do
      user = create(:user)
      quiz = create(:quiz, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/quizzes/#{quiz.id}/questions/new"

      expect(page).to have_content("Submit a Question the Answer for #{quiz.name}")
      expect(page).to_not have_button('Finish Questions')

      fill_in :question, with: 'Which tree family is Acer?'
      fill_in :answer, with: 'Maple'
      click_on 'Submit'

      question = Question.last

      expect(current_path).to eq("/quizzes/#{quiz.id}/questions/new")
      expect(page).to have_content('Current Quiz Questions')

      within("#question-#{question.id}") do
        expect(page).to have_content('Which tree family is Acer?')
        expect(page).to have_content('Maple')
        expect(page).to have_button('Edit Question')
        expect(page).to have_button('Delete Question')
        expect(page).to have_button('Edit Answer')
        expect(page).to have_button('Delete Answer')
      end

      expect(page).to have_button('Finish Question Submissions')
    end

    it 'user can edit a question or an answer' do
      user = create(:user)
      quiz = create(:quiz, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/quizzes/#{quiz.id}/questions/new"

      expect(page).to have_content("Submit a Question the Answer for #{quiz.name}")
      expect(page).to_not have_button('Finish Questions')

      fill_in :question, with: 'Which tree family is Acer?'
      fill_in :answer, with: 'Maple'
      click_on 'Submit'

      question = Question.last

      expect(current_path).to eq("/quizzes/#{quiz.id}/questions/new")
      expect(page).to have_content('Current Quiz Questions')

      within("#question-#{question.id}") do
        expect(page).to have_content('Which tree family is Acer?')
        expect(page).to have_content('Maple')
        expect(page).to have_button('Edit')
        expect(page).to have_button('Delete')
      end

      expect(page).to have_button('Finish Question Submissions')
    end
  end
end
