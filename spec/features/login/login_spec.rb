require 'rails_helper'

RSpec.describe 'login page' do
  describe 'happy paths' do
    it 'can authenticate a returning user when they enter valid credentials on the home page' do
      user = create(:user)

      visit '/'

      expect(page).to have_content('Welcome to Study Aide')

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on 'Login'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Welcome #{user.email}")
    end

    it 'when a user visits the page, they see a button to register a new account' do
      visit '/'

      expect(page).to have_button('New to Study Aide? Register Here')
    end

    it 'user can click register button to redirect to registration page and create new account' do
      visit '/'

      click_button 'New to Study Aide? Register Here'

      expect(current_path).to eq('/register')
      expect(page).to have_content('Welcome to Study Aide')

      fill_in :email, with: 'john_doe@example.com'
      fill_in :password, with: 'password1234'
      fill_in :password_confirmation, with: 'password1234'
      click_on 'Submit'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Welcome john_doe@example.com')
    end
  end

  describe 'sad paths' do
    it 'user sees a flash message indicating they entered an incorrect password' do
      user = create(:user)

      visit '/'

      expect(page).to have_content('Welcome to Study Aide')

      fill_in :email, with: user.email
      fill_in :password, with: 'WRONGPASSWORD'
      click_on 'Login'

      expect(current_path).to eq('/')
      expect(page).to have_content('Invalid Email or Password')
    end

    it 'user sees a flash message indicating they entered wrong password confirmation when registering' do
      visit '/'

      click_button 'New to Study Aide? Register Here'

      expect(current_path).to eq('/register')

      fill_in :email, with: 'john_doe@example.com'
      fill_in :password, with: 'password1234'
      fill_in :password_confirmation, with: 'password'
      click_on 'Submit'

      expect(current_path).to eq('/register')
      expect(page).to have_content('Sorry, your credentials are bad.')
    end
  end
end
