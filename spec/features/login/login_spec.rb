require 'rails_helper'

 RSpec.describe 'login page' do
   describe 'returning user visits home page' do
     it 'can authenticate a returning user when they enter valid credentials on the home page' do
       user = create(:user)

       visit '/'

       fill_in :email, with: user.email
       fill_in :password, with: user.password
       click_on 'Login'

       expect(current_path).to eq('/dashboard')
       expect(page).to have_content("Welcome #{user.email}")
     end
   end
 end
