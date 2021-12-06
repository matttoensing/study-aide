require 'rails_helper'

 RSpec.describe User do
   describe 'relationships' do
     it { should have_many(:quizzes) }
     it { should have_many(:assessments) }
   end

   describe 'validations' do
     it { should validate_presence_of(:email) }
     it { should validate_uniqueness_of(:email) }
     it { should validate_presence_of(:password)}
     it { should validate_confirmation_of(:password)}
   end
 end
