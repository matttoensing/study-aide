require 'rails_helper'

 RSpec.describe 'edit quiz page' do
   it 'displays a form to edit a quiz' do
     user = create(:user)
     quiz = create(:quiz, user: user)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

     visit "/quizzes/#{quiz.id}/edit"

     fill_in :name, with: 'Botany'
     fill_in :description, with: 'Rocky Mountain Flora Practice Quiz'
     click_on 'Submit'

     expect(current_path).to eq("/quizzes/#{quiz.id}")
     expect(page).to have_content('Botany')
     expect(page).to have_content('Rocky Mountain Flora Practice Quiz')
     expect(page).to have_content(quiz.subject)
   end
 end
