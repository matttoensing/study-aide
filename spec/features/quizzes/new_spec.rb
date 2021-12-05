require 'rails_helper'

 RSpec.describe 'new quiz' do
   describe 'happy paths' do
     it 'user sees a button on dashboard to create a new quiz' do
       user = create(:user)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit '/dashboard'

       expect(page).to have_button('Create a New Quiz')
     end

     it 'user is redirected to a new quiz page with a form for creating a new quiz' do
       user = create(:user)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit '/dashboard'

       click_button 'Create a New Quiz'

       expect(current_path).to eq('/quizzes/new')

       fill_in :name, with: 'Biology 101'
       fill_in :subject, with: 'Ecology'
       fill_in :description, with: 'Practice Quiz for ecology 101'
       click_on 'Create Quiz'

       quiz = Quiz.last

       expect(current_path).to eq("/quizzes/#{quiz.id}/questions/new")

       expect(quiz.name).to eq('Biology 101')
       expect(quiz.subject).to eq('Ecology')
       expect(quiz.description).to eq('Practice Quiz for ecology 101')
     end
   end
 end
