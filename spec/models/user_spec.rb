require 'rails_helper'

 RSpec.describe User do
   describe 'relationships' do
     it { should have_many(:quizzes) }
   end
 end
