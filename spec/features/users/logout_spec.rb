require 'rails_helper'

 RSpec.describe 'logout function' do
   it 'user can logout to end current session' do
     user = create(:user)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

     visit '/dashboard'

     expect(page).to have_link('Dashboard')
     expect(page).to have_link('Discover Quizzes')
     expect(page).to have_link('Logout')

     click_link 'Logout'

     expect(current_path).to eq('/')
   end
 end
