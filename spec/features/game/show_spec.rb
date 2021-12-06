require 'rails_helper'

 RSpec.describe 'game start page' do
   describe 'contents' do
     it 'displays buttons for flashcards and for quiz formats' do
       user = create(:user)
       quiz = create(:quiz, user: user)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit "/quizzes/#{quiz.id}/game"

       expect(page).to have_content("Which Format Would You Like to Start?")
       expect(page).to have_button('Flashcards')
       expect(page).to have_button('Quiz')
     end
   end
 end
