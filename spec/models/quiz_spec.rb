require 'rails_helper'

RSpec.describe Quiz do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:questions) }
    it { should have_many(:assessments) }
    it { should have_many(:answers).through(:questions) }
  end
end
