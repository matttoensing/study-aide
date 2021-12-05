require 'rails_helper'

 RSpec.describe 'quiz show page' do
   describe 'contents' do
     it 'displays quiz attributes and buttons to edit/delete quiz' do
       user = create(:user)
       quiz = create(:quiz, user: user)
       question = create(:question, quiz: quiz)
       question2 = create(:question, quiz: quiz)

       visit "/quizzes/#{quiz.id}"

       expect(page).to have_content(quiz.name)
       expect(page).to have_content(quiz.subject)
       expect(page).to have_content(quiz.description)
       expect(page).to have_content("Number of Questions: #{quiz.questions.count}")
       expect(page).to have_button('Take Quiz')
       expect(page).to have_button('Edit Quiz')
       expect(page).to have_button('Delete Quiz')
     end

     it 'when clicking on the edit button, user is redirected to a page to edit the quiz attributes' do
       user = create(:user)
       quiz = create(:quiz, user: user)

       visit "/quizzes/#{quiz.id}"

       click_button 'Edit Quiz'

       expect(current_path).to eq("/quizzes/#{quiz.id}/edit")
     end

     it 'when clicking on the delete button, quiz is removed from users quizzes' do
       user = create(:user)
       quiz = create(:quiz, user: user)
       question = create(:question, quiz: quiz)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit "/quizzes/#{quiz.id}"

       expect(page).to have_content(quiz.name)
       expect(page).to have_content(quiz.subject)
       expect(page).to have_content(quiz.description)

       click_button 'Delete Quiz'

       expect(current_path).to eq("/dashboard")
       expect(page).to_not have_content(quiz.name)
       expect(page).to_not have_content(quiz.subject)
       expect(page).to_not have_content(quiz.description)
     end

     it 'user clicks on take quiz button to start a quiz' do
       user = create(:user)
       quiz = create(:quiz, user: user)
       question = create(:question, quiz: quiz)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit "/quizzes/#{quiz.id}"

       click_button 'Take Quiz'

       expect(current_path).to eq("/quizzes/#{quiz.id}/game")
     end
   end
 end
