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

     it 'user can click on the button to start a new quiz' do
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

       within "#question-#{question.id}" do
         expect(page).to have_content(question.question)

         within "#answer-#{answer.id}" do
           expect(page).to have_content(answer.answer)
         end
       end
     end
   end
 end
