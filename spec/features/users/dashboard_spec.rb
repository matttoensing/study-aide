require 'rails_helper'

RSpec.describe 'users dashboard page' do
  describe 'contents' do
    it 'page displays a button to login or register if user is not logged in' do
      visit '/dashboard'

      expect(page).to have_content('You are Not Logged in')
      expect(page).to have_button('Log in Here')
      expect(page).to have_button('Register an Account')

      click_button 'Log in Here'

      expect(current_path).to eq('/')

      visit '/dashboard'

      click_button 'Register an Account'

      expect(current_path).to eq('/register')
    end

    it 'user sees no quizzes when they visit dashboard for the first time' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      expect(page).to have_content('You have no Quizzes yet')
      expect(page).to have_button('Create a New Quiz')
    end

    it 'displays all user quizzes with clickable buttons' do
      user = create(:user)
      quiz = create(:quiz, user: user)
      quiz2 = create(:quiz, user: user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      within "#quiz-#{quiz.id}" do
        expect(page).to have_content(quiz.name)
        expect(page).to have_content(quiz.subject)
        expect(page).to have_content(quiz.description)
        expect(page).to have_button('Visit Quiz Page')
      end

      within "#quiz-#{quiz2.id}" do
        expect(page).to have_content(quiz2.name)
        expect(page).to have_content(quiz2.subject)
        expect(page).to have_content(quiz2.description)
        expect(page).to have_button('Visit Quiz Page')
      end
    end

    it 'redirects user to quiz show page when clicking on visit button' do
      user = create(:user)
      quiz = create(:quiz, user: user)
      quiz2 = create(:quiz, user: user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      within "#quiz-#{quiz.id}" do
        click_button 'Visit Quiz Page'
      end

      expect().to eq()
    end
  end
end
